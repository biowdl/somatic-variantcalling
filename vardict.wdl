version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/vardict.wdl" as vardict
import "tasks/common.wdl" as common

workflow VarDict{
    input {
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        Reference reference
        String outputDir
    }

    String prefix = if (defined(controlSample)) then tumorSample + "-~{controlSample}" else tumorSample
    String scatterDir = outputDir + "/scatters/"

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
            outputDirPath = scatterDir
    }

    scatter (bed in scatterList.scatters){
        call vardict.VarDict as varDict {
            input:
                tumorSampleName = tumorSample,
                tumorBam = tumorBam,
                normalSampleName = controlSample,
                normalBam = controlBam,
                reference = reference,
                bedFile = bed,
                outputVcf = scatterDir + "/" + prefix + "-" + basename(bed) + ".vcf.gz"
        }

        File vardictFiles = varDict.vcfFile.file
    }

    call picard.SortVcf as gatherVcfs {
        input:
            vcfFiles = vardictFiles,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dict = reference.dict
    }

    output {
        IndexedVcfFile outputVCF = gatherVcfs.outputVcf
    }
}