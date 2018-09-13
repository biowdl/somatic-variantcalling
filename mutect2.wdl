version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/gatk.wdl" as gatk
import "tasks/picard.wdl" as picard
import "tasks/common.wdl" as common

workflow Mutect2 {
    input {
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        Reference reference

        String vcfPath
    }

    String scatterDir = vcfPath + "_scatters/"

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
            outputDirPath = scatterDir
    }

    scatter (bam in select_all([tumorBam, controlBam])) {
        File bamFiles = bam.file
        File indexFiles = bam.index
    }

    scatter (bed in scatterList.scatters) {
        call gatk.MuTect2 as mutect2 {
            input:
                inputBams = bamFiles,
                inputBamsIndex = indexFiles,
                reference = reference,
                outputVcf = scatterDir + "/" + basename(bed) + ".vcf.gz",
                tumorSample = tumorSample,
                normalSample = controlSample,
                intervals = [bed]
        }

        File mutectFiles = mutect2.vcfFile.file
        File mutectIndexFiles = mutect2.vcfFile.index
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutectFiles,
            inputVCFsIndexes = mutectIndexFiles,
            outputVcfPath = vcfPath
    }

    output {
        IndexedVcfFile outputVCF = gatherVcfs.outputVcf
    }
}