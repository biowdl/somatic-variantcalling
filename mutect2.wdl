version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/gatk.wdl" as gatk
import "tasks/picard.wdl" as picard
import "tasks/common.wdl" as common

workflow Mutect2 {
    input {
        String outputDir
        Reference reference
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        File? regions

        Map[String, String] dockerTags = {
            "picard":"2.18.26--0",
            "biopet-scatterregions": "0.2--0",
            "gatk": "4.1.0.0--0"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call biopet.ScatterRegions as scatterList {
        input:
            reference = reference,
            regions = regions,
            dockerTag = dockerTags["biopet-scatterregions"]

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
                outputVcf = prefix + "-" + basename(bed) + ".vcf.gz",
                tumorSample = tumorSample,
                normalSample = controlSample,
                intervals = [bed],
                dockerTag = dockerTags["gatk"]
        }

        File mutectFiles = mutect2.vcfFile.file
        File mutectIndexFiles = mutect2.vcfFile.index
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutectFiles,
            inputVCFsIndexes = mutectIndexFiles,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dockerTag = dockerTags["picard"]
    }

    output {
        IndexedVcfFile outputVCF = gatherVcfs.outputVcf
    }
}