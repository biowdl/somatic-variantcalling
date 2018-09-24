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

        Boolean runManta = true
    }

    String scatterDir = outputDir + "/scatters/"

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
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
                    tumorBam = tumorBam,
                    reference = reference,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }

            call manta.RunSomatic as mantaSomaticRun {
                input:
                    runDir = mantaSomatic.runDirectory,
                    paired = defined(controlBam)
            }

            File mantaTumorSV = mantaSomaticRun.tumorSV.file
            File mantaTumorSVIndex = mantaSomaticRun.tumorSV.index
        }

        if (defined(controlBam)){
            call strelka.ConfigureSomatic as strelkaSomatic {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_runStrelka",
                    normalBam = select_first([controlBam]),
                    tumorBam = tumorBam,
                    reference = reference,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index,
                    indelCandidates = mantaSomaticRun.condidateSmallIndels,
            }
        }

        if (! defined(controlBam)) {
            call strelka.ConfigureGermline as strelkaGermline {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_runStrelka",
                    bams = [tumorBam.file],
                    indexes= [tumorBam.index],
                    reference = reference,
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
                inputVCFs = select_all(mantaTumorSV),
                inputVCFsIndexes = select_all(mantaTumorSVIndex),
                outputVcfPath = outputDir + "/" + basename + "_manta.vcf.gz"
        }
    }

    if (defined(controlBam)){
        call picard.MergeVCFs as gatherIndels {
            input:
                inputVCFs = select_all(strelkaRun.indelsVcf),
                inputVCFsIndexes = select_all(strelkaRun.indelsIndex),
                outputVcfPath = outputDir + "/" + basename + "_indels.vcf.gz"

        }
    }

    call picard.MergeVCFs as gatherVariants {
        input:
            inputVCFs = strelkaRun.variants,
            inputVCFsIndexes = strelkaRun.variantsIndex,
            outputVcfPath = outputDir + "/" + basename + "_variants.vcf.gz"
    }

    output {
        IndexedVcfFile? mantaVCF = gatherSVs.outputVcf
        IndexedVcfFile? indelsVCF = gatherIndels.outputVcf

        IndexedVcfFile variantsVCF = gatherVariants.outputVcf
    }
}

