version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/manta.wdl" as manta
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/strelka.wdl" as strelka
import "tasks/common.wdl" as common

workflow Strelka {
    input {
        IndexedBamFile tumorBam
        IndexedBamFile? controlBam
        Reference reference
        String outputDir
        String basename = "strelka"
        File? regions

        Boolean runManta = true
    }

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
            regions = regions
    }

    scatter (bed in scatterList.scatters) {
        call samtools.BgzipAndIndex as bedPrepare {
            input:
                inputFile = bed,
                outputDir = ".",
                type = "bed"
        }

        if (runManta) {
            call manta.Somatic as mantaSomatic {
                input:
                    runDir = basename(bed) + "_runManta",
                    normalBam = controlBam,
                    tumorBam = tumorBam,
                    reference = reference,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }

            File mantaTumorSV = mantaSomatic.tumorSV.file
            File mantaTumorSVIndex = mantaSomatic.tumorSV.index
        }

        if (defined(controlBam)){
            call strelka.Somatic as strelkaSomatic {
                input:
                    runDir = basename(bed) + "_runStrelka",
                    normalBam = select_first([controlBam]),
                    tumorBam = tumorBam,
                    reference = reference,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    indelCandidates = mantaSomatic.candidateSmallIndels,
            }
        }

        if (! defined(controlBam)) {
            call strelka.Germline as strelkaGermline {
                input:
                    runDir = basename(bed) + "_runStrelka",
                    bams = [tumorBam.file],
                    indexes= [tumorBam.index],
                    reference = reference,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }
        }
    }

    if (runManta) {
        call picard.MergeVCFs as gatherSVs {
            input:
                inputVCFs = select_all(mantaTumorSV),
                inputVCFsIndexes = select_all(mantaTumorSVIndex),
                outputVcfPath = outputDir + "/" + basename + "_manta.vcf.gz"
        }
    }

    if (defined(controlBam)){
        call picard.MergeVCFs as gatherIndels {
            input:
                inputVCFs = select_all(strelkaSomatic.indelsVcf),
                inputVCFsIndexes = select_all(strelkaSomatic.indelsIndex),
                outputVcfPath = outputDir + "/" + basename + "_indels.vcf.gz"
        }
    }

    call picard.MergeVCFs as gatherVariants {
        input:
            inputVCFs = if defined(controlBam)
                then select_all(strelkaSomatic.variants)
                else select_all(strelkaGermline.variants),
            inputVCFsIndexes = if defined(controlBam)
                then select_all(strelkaSomatic.variantsIndex)
                else select_all(strelkaGermline.variantsIndex),
            outputVcfPath = outputDir + "/" + basename + "_variants.vcf.gz"
    }

    output {
        IndexedVcfFile variantsVCF = gatherVariants.outputVcf
        IndexedVcfFile? mantaVCF = gatherSVs.outputVcf
        IndexedVcfFile? indelsVCF = gatherIndels.outputVcf
    }
}

