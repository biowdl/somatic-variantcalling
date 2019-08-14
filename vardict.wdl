version 1.0

import "tasks/chunked-scatter.wdl" as chunkedScatter
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/vardict.wdl" as vardict

workflow VarDict{
    input {
        String tumorSample
        File tumorBam
        File tumorBamIndex
        String? controlSample
        File? controlBam
        File? controlBamIndex
        File referenceFasta
        File referenceFastaFai
        File referenceFastaDict
        String outputDir = "."
        File? regions

        Boolean filterSupplementaryAlignments = false

        Map[String, String] dockerImages = {
            "picard":"quay.io/biocontainers/picard:2.18.26--0",
            "vardict-java": "quay.io/biocontainers/vardict-java:1.5.8--1"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call chunkedScatter.ChunkedScatter as scatterList {
        input:
            inputFile = if defined(regions)
             then select_first([regions])
             else referenceFastaDict
    }

    if (filterSupplementaryAlignments) {
        call samtools.View as filterSupplementaryTumor {
            input:
                inFile = tumorBam,
                excludeFilter = 2048
        }

        if (defined(controlBam)) {
            call samtools.View as filterSupplementaryControl {
                input:
                    inFile = select_first([controlBam]),
                    excludeFilter = 2048
            }
        }
    }

    scatter (bed in scatterList.scatters){
        call vardict.VarDict as varDict {
            input:
                tumorSampleName = tumorSample,
                tumorBam = select_first([filterSupplementaryTumor.outputBam, tumorBam]),
                tumorBamIndex = select_first([filterSupplementaryTumor.outputBamIndex, tumorBamIndex]),
                normalSampleName = controlSample,
                normalBam = if defined(filterSupplementaryControl.outputBam)
                    then filterSupplementaryControl.outputBam
                    else controlBam,
                normalBamIndex = if defined(filterSupplementaryControl.outputBam)
                    then filterSupplementaryControl.outputBamIndex
                    else controlBamIndex,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                bedFile = bed,
                outputVcf = prefix + "-" + basename(bed) + ".vcf",
                dockerImage = dockerImages["vardict-java"]
        }
    }

    call picard.SortVcf as gatherVcfs {
        input:
            vcfFiles = varDict.vcfFile,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dict = referenceFastaDict,
            dockerImage = dockerImages["picard"]
    }

    output {
        File outputVcf = gatherVcfs.outputVcf
        File outputVcfIndex = gatherVcfs.outputVcfIndex
    }
}