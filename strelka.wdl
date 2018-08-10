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
            call manta.ConfigureSomatic as mantaSomatic {
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

            call manta.RunSomatic as mantaSomaticRun {
                input:
                    runDir = mantaSomatic.runDirectory,
                    paired = defined(controlBam)
            }
        }

        if (defined(controlBam)){
            call strelka.ConfigureSomatic as strelkaSomatic {
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
                    indelCandidates = mantaSomaticRun.condidateSmallIndels,
                    indelCandidatesIndex = mantaSomaticRun.condidateSmallIndelsIndex
            }
        }

        if (! defined(controlBam)) {
            call strelka.ConfigureGermline as strelkaGermline {
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

        call strelka.Run as strelkaRun {
            input:
                runDir = if defined(controlBam)
                    then select_first([strelkaSomatic.runDirectory])
                    else select_first([strelkaGermline.runDirectory]),
                somatic = defined(controlBam)
        }
    }

    if (runManta) {
        call picard.MergeVCFs as gatherSVs {
            input:
                inputVCFs = select_all(mantaSomaticRun.tumorSV),
                inputVCFsIndexes = select_all(mantaSomaticRun.tumorSVindex),
                outputVCFpath = outputDir + "/" + basename + "_manta.vcf.gz"
        }
    }

    if (defined(controlBam)){
        call picard.MergeVCFs as gatherIndels {
            input:
                inputVCFs = select_all(strelkaRun.indelsVcf),
                inputVCFsIndexes = select_all(strelkaRun.indelsIndex),
                outputVCFpath = outputDir + "/" + basename + "_indels.vcf.gz"

        }
    }

    call picard.MergeVCFs as gatherVariants {
        input:
            inputVCFs = strelkaRun.variants,
            inputVCFsIndexes = strelkaRun.variantsIndex,
            outputVCFpath = outputDir + "/" + basename + "_snvs.vcf.gz"
    }

    output {
        File? mantaVCF = gatherSVs.outputVCF
        File? mantaVCFindex = gatherSVs.outputVCFindex
        File? indelsVCF = gatherIndels.outputVCF
        File? indelsVCFindex = gatherIndels.outputVCFindex

        File variantsVCF = gatherVariants.outputVCF
        File variantsVCFindex = gatherVariants.outputVCFindex
    }
}

