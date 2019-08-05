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
        File? variantsForContamination
        File? variantsForContaminationIndex
        File? sitesForContamination
        File? sitesForContaminationIndex

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

    call gatk.MergeStats as mergeStats {
        input:
            stats = mutect2.stats,
            dockerImage = dockerImages["gatk4"]
    }

    # Read orientation artifacts workflow
    if (defined(variantsForContamination) && defined(variantsForContaminationIndex)
        && defined(sitesForContamination) && defined(sitesForContaminationIndex)) {
        call gatk.LearnReadOrientationModel as learnReadOrientationModel {
            input:
                f1r2TarGz = mutect2.f1r2File,
                dockerImage = dockerImages["gatk4"]
        }

        call gatk.GetPileupSummaries as getPileupSummariesTumor {
            input:
                sampleBam = tumorBam,
                sampleBamIndex = tumorBamIndex,
                variantsForContamination = select_first([variantsForContamination]),
                variantsForContaminationIndex = select_first([variantsForContaminationIndex]),
                sitesForContamination = select_first([sitesForContamination]),
                sitesForContaminationIndex = select_first([sitesForContaminationIndex]),
                outputPrefix = prefix + "-tumor",
                dockerImage = dockerImages["gatk4"]
        }

        if (defined(controlBam)) {
            call gatk.GetPileupSummaries as getPileupSummariesNormal {
                input:
                    sampleBam = select_first([controlBam]),
                    sampleBamIndex = select_first([controlBamIndex]),
                    variantsForContamination = select_first([variantsForContamination]),
                    variantsForContaminationIndex = select_first([variantsForContaminationIndex]),
                    sitesForContamination = select_first([sitesForContamination]),
                    sitesForContaminationIndex = select_first([sitesForContaminationIndex]),
                    outputPrefix = prefix + "-normal",
                    dockerImage = dockerImages["gatk4"]
            }
        }

        if (defined(getPileupSummariesNormal.pileups)) {
            File normalPileups = select_first([getPileupSummariesNormal.pileups])
        }
        call gatk.CalculateContamination as calculateContamination {
            input:
                tumorPileups = getPileupSummariesTumor.pileups,
                normalPileups = normalPileups,
                dockerImage = dockerImages["gatk4"]
        }
    }

    call picard.MergeVCFs as gatherVcfs {
        input:
            inputVCFs = mutect2.vcfFile,
            inputVCFsIndexes = mutect2.vcfFileIndex,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dockerImage = dockerImages["picard"]
    }

    call gatk.FilterMutectCalls as filterMutectCalls {
        input:
            referenceFasta = referenceFasta,
            referenceFastaFai = referenceFastaFai,
            referenceFastaDict = referenceFastaDict,
            unfilteredVcf = gatherVcfs.outputVcf,
            unfilteredVcfIndex = gatherVcfs.outputVcfIndex,
            outputVcf = outputDir + "/" + prefix + "-filtered.vcf.gz",
            contaminationTable = calculateContamination.contaminationTable,
            mafTumorSegments = calculateContamination.mafTumorSegments,
            artifactPriors= learnReadOrientationModel.artifactPriorsTable,
            mutect2Stats = mergeStats.mergedStats,
            dockerImage = dockerImages["gatk4"]
    }

    output {
        File outputVcf = filterMutectCalls.filteredVcf
        File outputVcfIndex = filterMutectCalls.filteredVcfIndex
        File filteringStats = filterMutectCalls.filteringStats
    }
}