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

    call mutect2Workflow.Mutect2 as mutect2 {
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
                then "${outputDir}/mutect2/${tumorSample}-${controlSample}.vcf.gz"
                else "${outputDir}/mutect2/${tumorSample}.vcf.gz"
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
            outputDir = "${outputDir}/strelka"
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
                then "${outputDir}/vardict/${tumorSample}-${controlSample}.vcf.gz"
                else "${outputDir}/vardict/${tumorSample}.vcf.gz"
    }

    #TODO some kind of merging (SomaticSeq?)
    #TODO metrics?

    output{
        File mutect2Vcf = mutect2.outputVCF
        File mutect2Index = mutect2.outputVCFindex
        File vardictVcf = vardict.outputVCF
        File vardictIndex = vardict.outputVCFindex
        File strelkaSnvsVcf = strelka.snvVCF
        File strelkaSnvsIndex = strelka.snvVCFindex
        File? strelkaIndelsVcf = strelka.indelsVCF
        File? strelkaIndelsIndex = strelka.indelsVCFindex
        File? mantaVcf = strelka.mantaVCF
        File? mantaIndex = strelka.mantaVCFindex
    }
}