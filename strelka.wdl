version 1.0

import "tasks/biopet.wdl" as biopet
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/strelka.wdl" as strelkaTask

workflow Strelka {
    input {
        File? controlBam
        File? controlIndex
        File tumorBam
        File tumorIndex
        File refFasta
        File refFastaIndex
        File refDict
        String vcfPath
    }

    String scatterDir = sub(vcfPath, basename(vcfPath), "/scatters/")

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

        if (defined(controlBam)){
            #TODO manta SV calling reults should be given to strelka somatic

            call strelkaTask.Somatic as strelkaSomatic {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_run",
                    normalBam = select_first([controlBam]),
                    normalIndex = select_first([controlIndex]),
                    tumorBam = tumorBam,
                    tumorIndex = tumorIndex,
                    refFasta = refFasta,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }
        }

        if (! defined(controlBam)) {
            call strelkaTask.Germline as strelkaGermline {
                input:
                    runDir = scatterDir + "/" + basename(bed) + "_run",
                    bams = [tumorBam],
                    indexes = [tumorIndex],
                    refFasta = refFasta,
                    callRegions = bedPrepare.compressed,
                    callRegionsIndex = bedPrepare.index
            }
        }
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = if defined(controlBam)
                then select_all(flatten([strelkaSomatic.snvVcf, strelkaSomatic.indelsVcf]))
                else select_all(strelkaGermline.variants),
            inputVCFsIndexes = if defined(controlBam)
                then select_all(flatten([strelkaSomatic.snvIndex, strelkaSomatic.indelsIndex]))
                else select_all(strelkaGermline.variantsIndex),
            outputVCFpath = vcfPath
    }

    output {
        File outputVCF = gatherVcfs.outputVCF
        File outputVCFindex = gatherVcfs.outputVCFindex
    }
}

