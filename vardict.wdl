version 1.0

import "tasks/biopet.wdl" as biopet
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/vardict.wdl" as vardict

workflow VarDict{
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

    String scatterDir = vcfPath + "_scatters/"

    call biopet.ScatterRegions as scatterList {
        input:
            refFasta = refFasta,
            refDict = refDict,
            outputDirPath = scatterDir
    }

    scatter (bed in scatterList.scatters){
        call vardict.VarDict as varDict {
            input:
                tumorSampleName = tumorSample,
                tumorBam = tumorBam,
                tumorIndex = tumorIndex,
                normalSampleName = controlSample,
                normalBam = controlBam,
                normalIndex = controlIndex,
                refFasta = refFasta,
                bedFile = bed,
                outputVcf = scatterDir + "/" + basename(bed) + ".vcf.gz"
        }

        call samtools.Tabix as index {
            input:
                inputFile = varDict.vcfFile
        }
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = varDict.vcfFile,
            inputVCFsIndexes = index.index,
            outputVCFpath = vcfPath
    }

    output {
        File outputVCF = gatherVcfs.outputVCF
        File outputVCFindex = gatherVcfs.outputVCFindex
    }
}