version 1.0

import "tasks/biopet.wdl" as biopet
import "tasks/gatk.wdl" as gatk
import "tasks/picard.wdl" as picard

workflow Mutect2Workflow {
    input {
        String tumorSample
        File tumorBam
        File tumorIndex
        String? controlSample
        File? controlBam
        File? controlIndex
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
        call gatk.MuTect2 as mutect2 {
            input:
                inputBams = select_all([tumorBam, controlBam]),
                inputBamIndex = select_all([tumorIndex, controlIndex]),
                refFasta = refFasta,
                refFastaIndex = refFastaIndex,
                refDict = refDict,
                outputVcf = scatterDir + "/" + basename(bed) + ".vcf",
                tumorSample = tumorSample,
                normalSample = controlSample,
                intervals = [bed]
        }
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutect2.vcfFile,
            inputVCFsIndexes = mutect2.vcfIndex,
            outputVCFpath = vcfPath
    }

    output {
        File outputVCF = gatherVcfs.outputVCF
        File outputVCFindex = gatherVcfs.outputVCFindex
    }
}