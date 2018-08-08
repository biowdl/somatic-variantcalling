version 1.0

import "tasks/biopet.wdl" as biopet
import "tasks/manta.wdl" as manta
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/strelka.wdl" as strelka

workflow Strelka {
    input {
        File? controlBam
        File? controlIndex
        File tumorBam
        File tumorIndex
        File refFasta
        File refFastaIndex
        File refDict
        String outputDir
        String basename = "strelka"

        Boolean runManta = true
    }

    String scatterDir = outputDir + "/scatters/"

    call biopet.ScatterRegions as scatterList {
        input:
            refFasta = refFasta,
            refDict = refDict,
            outputDirPath = scatterDir
    }

    scatter (bed in scatterList.scatters) {
        call samtools.BgzipAndIndex as bedPrepare {
            input:
                inputFile = bed,
                outputDir = scatterDir,
                type = "bed"
        }

        if (runManta) {
            call manta.Somatic as mantaSomatic {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_runManta",
                    normalBam = controlBam,
                    normalIndex = controlIndex,
                    tumorBam = tumorBam,
                    tumorIndex = tumorIndex,
                    refFasta = refFasta,
                    refFastaIndex = refFastaIndex,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }
        }

        if (defined(controlBam)){
            call strelka.Somatic as strelkaSomatic {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_runStrelka",
                    normalBam = select_first([controlBam]),
                    normalIndex = select_first([controlIndex]),
                    tumorBam = tumorBam,
                    tumorIndex = tumorIndex,
                    refFasta = refFasta,
                    refFastaIndex = refFastaIndex,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    indelCandidates = mantaSomatic.condidateSmallIndels,
                    indelCandidatesIndex = mantaSomatic.condidateSmallIndelsIndex
            }
        }

        if (! defined(controlBam)) {
            call strelka.Germline as strelkaGermline {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_runStrelka",
                    bams = [tumorBam],
                    indexes = [tumorIndex],
                    refFasta = refFasta,
                    refFastaIndex = refFastaIndex,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }
        }
    }

    if (runManta) {
        call picard.MergeVCFs as gatherSVs {
            input:
                inputVCFs = select_all(mantaSomatic.tumorSV),
                inputVCFsIndexes = select_all(mantaSomatic.tumorSVindex),
                outputVCFpath = outputDir + "/" + basename + "_manta.vcf.gz"
        }
    }

    if (defined(controlBam)){
        call picard.MergeVCFs as gatherIndels {
            input:
                inputVCFs = select_all(strelkaSomatic.indelsVcf),
                inputVCFsIndexes = select_all(strelkaSomatic.indelsIndex),
                outputVCFpath = outputDir + "/" + basename + "_indels.vcf.gz"

        }
    }

    call picard.MergeVCFs as gatherSnvs {
        input:
            inputVCFs = if defined(controlBam)
                then select_all(strelkaSomatic.snvVcf)
                else select_all(strelkaGermline.variants),
            inputVCFsIndexes = if defined(controlBam)
                then select_all(strelkaSomatic.snvIndex)
                else select_all(strelkaGermline.variantsIndex),
            outputVCFpath = outputDir + "/" + basename + "_snvs.vcf.gz"
    }

    output {
        File? mantaVCF = gatherSVs.outputVCF
        File? mantaVCFindex = gatherSVs.outputVCFindex
        File? indelsVCF = gatherIndels.outputVCF
        File? indelsVCFindex = gatherIndels.outputVCFindex

        File snvVCF = gatherSnvs.outputVCF
        File snvVCFindex = gatherSnvs.outputVCFindex
    }
}

