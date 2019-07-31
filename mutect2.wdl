version 1.0

import "tasks/biopet/biopet.wdl" as biopet
import "tasks/gatk.wdl" as gatk
import "tasks/picard.wdl" as picard

workflow Mutect2 {
    input {
        String outputDir = "."
        File referenceFasta
        File referenceFastaDict
        File referenceFastaFai
        String tumorSample
        File tumorBam
        File tumorBamIndex
        String? controlSample
        File? controlBam
        File? controlBamIndex
        File? regions

        Map[String, String] dockerImages = {
          "picard":"quay.io/biocontainers/picard:2.19.0--0",
          "gatk4":"quay.io/biocontainers/gatk4:4.1.2.0--1",
          "biopet-scatterregions":"quay.io/biocontainers/biopet-scatterregions:0.2--0"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call biopet.ScatterRegions as scatterList {
        input:
            referenceFasta = referenceFasta,
            referenceFastaDict = referenceFastaDict,
            regions = regions,
            dockerImage = dockerImages["biopet-scatterregions"]

    }

    scatter (bed in scatterList.scatters) {
        call gatk.MuTect2 as mutect2 {
            input:
                inputBams = select_all([tumorBam, controlBam]),
                inputBamsIndex = select_all([tumorBamIndex, controlBamIndex]),
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                referenceFastaDict = referenceFastaDict,
                outputVcf = prefix + "-" + basename(bed) + ".vcf.gz",
                tumorSample = tumorSample,
                normalSample = controlSample,
                intervals = [bed],
                dockerImage = dockerImages["gatk4"]
        }
    }

    call gatk.LearnReadOrientationModel as learnReadOrientationModel {
        input:
            f1r2TarGz = mutect2.f1r2File
    }

    call gatk.MergeStats as mergeStats {
        input:
            stats = mutect2.stats
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutect2.vcfFile,
            inputVCFsIndexes = mutect2.vcfFileIndex,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dockerImage = dockerImages["picard"]
    }

    output {
        File outputVcf = gatherVcfs.outputVcf
        File outputVcfIndex= gatherVcfs.outputVcfIndex
    }
}