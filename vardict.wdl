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
        File? regions

        Map[String, String] dockerTags = {
            "picard":"2.18.26--0",
            "biopet-scatterregions": "0.2--0",
            "vardict": "1.5.8--1"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
            regions = regions,
            bamFile = tumorBam.file,
            bamIndex = tumorBam.index,
            dockerTag = dockerTags["biopet-scatterregions"]
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
                outputVcf = prefix + "-" + basename(bed) + ".vcf",
                dockerTag = dockerTags["vardict"]
        }
    }

    call picard.SortVcf as gatherVcfs {
        input:
            vcfFiles = varDict.vcfFile,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dict = reference.dict,
            dockerTag = dockerTags["picard"]
    }

    output {
        IndexedVcfFile outputVCF = gatherVcfs.outputVcf
    }
}