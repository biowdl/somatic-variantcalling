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

        Map[String, String] dockerImages = {
          "picard":"quay.io/biocontainers/picard:2.18.26--0",
          "gatk4":"quay.io/biocontainers/gatk4:4.1.0.0--0",
          "biopet-scatterregions":"quay.io/biocontainers/biopet-scatterregions:0.2--0"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call biopet.ScatterRegions as scatterList {
        input:
            referenceFasta = reference.fasta,
            referenceFastaDict = reference.dict,
            regions = regions,
            dockerImage = dockerImages["biopet-scatterregions"]

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
                referenceFasta = reference.fasta,
                referenceFastaFai = reference.fai,
                referenceFastaDict = reference.dict,
                outputVcf = prefix + "-" + basename(bed) + ".vcf.gz",
                tumorSample = tumorSample,
                normalSample = controlSample,
                intervals = [bed],
                dockerImage = dockerImages["gatk4"]
        }

        File mutectFiles = mutect2.vcfFile
        File mutectIndexFiles = mutect2.vcfFileIndex
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutectFiles,
            inputVCFsIndexes = mutectIndexFiles,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dockerImage = dockerImages["picard"]
    }

    output {
        IndexedVcfFile outputVCF = object {file: gatherVcfs.outputVcf, index: gatherVcfs.outputVcfIndex }
    }
}