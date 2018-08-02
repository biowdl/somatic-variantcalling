version 1.0

import "mutect2.wdl" as mutect2Workflow
import "strelka.wdl" as strelkaWorkflow
import "vardict.wdl" as vardictWorkflow

workflow SomaticVariantcalling {
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

        String outputDir
    }

    call mutect2Workflow.Mutect2Workflow as mutect2 {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            controlSample = controlSample,
            controlBam = controlBam,
            controlIndex = controlIndex,
            refFasta = refFasta,
            refFastaIndex = refFastaIndex,
            refDict = refDict,
            vcfPath = if defined(controlBam)
                then "${outputDir}/mutect2/${tumorSample}-${controlSample}.vcf"
                else "${outputDir}/mutect2/${tumorSample}.vcf"
    }

    call strelkaWorkflow.Strelka as strelka {
        input:
            controlBam = controlBam,
            controlIndex = controlIndex,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            refFasta = refFasta,
            refFastaIndex = refFastaIndex,
            refDict = refDict,
            vcfPath = if defined(controlBam)
                then "${outputDir}/strelka/${tumorSample}-${controlSample}.vcf"
                else "${outputDir}/strelka/${tumorSample}.vcf"
    }

    call vardictWorkflow.VarDict as vardict {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            controlSample = controlSample,
            controlBam = controlBam,
            controlIndex = controlIndex,
            refFasta = refFasta,
            refFastaIndex = refFastaIndex,
            refDict = refDict,
            vcfPath = if defined(controlBam)
                then "${outputDir}/vardict/${tumorSample}-${controlSample}.vcf"
                else "${outputDir}/vardict/${tumorSample}.vcf"
    }

    #TODO some kind of merging (SomaticSeq?)
    #TODO metrics?

    output{
        File mutect2Vcf = mutect2.outputVCF
        File mutect2Index = mutect2.outputVCFindex
        File strelkaVcf = strelka.outputVCF
        File strelkaIndex = strelka.outputVCFindex
        File vardictVcf = vardict.outputVCF
        File vardictIndex = vardict.outputVCFindex
    }
}