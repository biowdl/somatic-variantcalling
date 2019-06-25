version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/manta.wdl" as manta
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/strelka.wdl" as strelka
import "tasks/common.wdl" as common

workflow Strelka {
    input {
        File tumorBam
        File tumorBamIndex
        File? controlBam
        File? controlBamIndex
        File referenceFasta
        File referenceFastaFai
        File referenceFastaDict
        String outputDir = "."
        String basename = "strelka"
        Boolean runManta = true
        File? regions

        Map[String, String] dockerImages = {
            "picard":"quay.io/biocontainers/picard:2.18.26--0",
            "biopet-scatterregions":"quay.io/biocontainers/biopet-scatterregions:0.2--0",
            "tabix":"quay.io/biocontainers/tabix:0.2.6--ha92aebf_0",
            "manta": "quay.io/biocontainers/manta:1.4.0--py27_1",
            "strelka": "quay.io/biocontainers/strelka:2.9.7--0"
        }
    }

    call biopet.ScatterRegions as scatterList {
        input:
            referenceFasta = referenceFasta,
            referenceFastaDict = referenceFastaDict,
            regions = regions,
            dockerImage = dockerImages["biopet-scatterregions"]
    }

    scatter (bed in scatterList.scatters) {
        call samtools.BgzipAndIndex as bedPrepare {
            input:
                inputFile = bed,
                outputDir = ".",
                type = "bed",
                dockerImage = dockerImages["tabix"]
        }

        if (runManta) {
            call manta.Somatic as mantaSomatic {
                input:
                    runDir = basename(bed) + "_runManta",
                    normalBam = controlBam,
                    normalBamIndex = controlBamIndex,
                    tumorBam = tumorBam,
                    tumorBamIndex = tumorBamIndex,
                    referenceFasta = referenceFasta,
                    referenceFastaFai = referenceFastaFai,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    dockerImage = dockerImages["manta"]
            }
        }

        if (defined(controlBam)){
            call strelka.Somatic as strelkaSomatic {
                input:
                    runDir = basename(bed) + "_runStrelka",
                    normalBam = select_first([controlBam]),
                    normalBamIndex = select_first([controlBamIndex]),
                    tumorBam = tumorBam,
                    tumorBamIndex = tumorBamIndex,
                    referenceFasta = referenceFasta,
                    referenceFastaFai = referenceFastaFai,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    indelCandidatesVcf = mantaSomatic.candidateSmallIndelsVcf,
                    indelCandidatesVcfIndex = mantaSomatic.candidateSmallIndelsVcfIndex,
                    dockerImage = dockerImages["strelka"]
            }
        }

        if (! defined(controlBam)) {
            call strelka.Germline as strelkaGermline {
                input:
                    runDir = basename(bed) + "_runStrelka",
                    bams = [tumorBam],
                    indexes= [tumorBamIndex],
                    referenceFasta = referenceFasta,
                    referenceFastaFai = referenceFastaFai,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    dockerImage = dockerImages["strelka"]
            }
        }
    }

    if (runManta) {
        call picard.MergeVCFs as gatherSVs {
            input:
                inputVCFs = select_all(mantaSomatic.tumorSVVcf),
                inputVCFsIndexes = select_all(mantaSomatic.tumorSVVcfIndex),
                outputVcfPath = outputDir + "/" + basename + "_manta.vcf.gz",
                dockerImage = dockerImages["picard"]
        }
        IndexedVcfFile mantaVcf = object {file: gatherSVs.outputVcf, index: gatherSVs.outputVcfIndex}
    }

    if (defined(controlBam)){
        call picard.MergeVCFs as gatherIndels {
            input:
                inputVCFs = select_all(strelkaSomatic.indelsVcf),
                inputVCFsIndexes = select_all(strelkaSomatic.indelsIndex),
                outputVcfPath = outputDir + "/" + basename + "_indels.vcf.gz",
                dockerImage = dockerImages["picard"]
        }
        IndexedVcfFile indelsVcf = object {file: gatherIndels.outputVcf, index: gatherIndels.outputVcfIndex}
    }

    call picard.MergeVCFs as gatherVariants {
        input:
            inputVCFs = if defined(controlBam)
                then select_all(strelkaSomatic.variants)
                else select_all(strelkaGermline.variants),
            inputVCFsIndexes = if defined(controlBam)
                then select_all(strelkaSomatic.variantsIndex)
                else select_all(strelkaGermline.variantsIndex),
            outputVcfPath = outputDir + "/" + basename + "_variants.vcf.gz",
            dockerImage = dockerImages["picard"]
    }

    output {
        IndexedVcfFile variantsVCF = object {file: gatherVariants.outputVcf, index: gatherVariants.outputVcfIndex}
        IndexedVcfFile? mantaVCF =  mantaVcf
        IndexedVcfFile? indelsVCF = indelsVcf
    }
}

