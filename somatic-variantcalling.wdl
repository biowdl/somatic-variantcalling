version 1.0

import "mutect2.wdl" as mutect2Workflow
import "tasks/common.wdl" as common
import "tasks/somaticseq.wdl" as somaticSeqTask
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
        Reference ref

        String outputDir
    }

    String mutect2Dir = outputDir + "/mutect2"
    String strelkaDir = outputDir + "/strelka"
    String vardictDir = outputDir + "/vardict"
    String somaticSeqDir = outputDir + "/somaticSeq"

    call mutect2Workflow.Mutect2 as mutect2 {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            controlSample = controlSample,
            controlBam = controlBam,
            controlIndex = controlIndex,
            refFasta = ref.fasta,
            refFastaIndex = ref.fai,
            refDict = ref.dict,
            vcfPath = if defined(controlBam)
                then "${mutect2Dir}/${tumorSample}-${controlSample}.vcf.gz"
                else "${mutect2Dir}/${tumorSample}.vcf.gz"
    }

    call strelkaWorkflow.Strelka as strelka {
        input:
            controlBam = controlBam,
            controlIndex = controlIndex,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            refFasta = ref.fasta,
            refFastaIndex = ref.fai,
            refDict = ref.dict,
            outputDir = strelkaDir,
            basename = if defined(controlBam)
                then "${tumorSample}-${controlSample}"
                else tumorSample
    }

    call vardictWorkflow.VarDict as vardict {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            tumorIndex = tumorIndex,
            controlSample = controlSample,
            controlBam = controlBam,
            controlIndex = controlIndex,
            refFasta = ref.fasta,
            refFastaIndex = ref.fai,
            refDict = ref.dict,
            vcfPath = if defined(controlBam)
                then "${vardictDir}/${tumorSample}-${controlSample}.vcf.gz"
                else "${vardictDir}/${tumorSample}.vcf.gz"
    }

    if (defined(controlBam)) {
        call somaticSeqTask.SomaticSeqWrapper as somaticSeq {
            input:
                outputDir = somaticSeqDir,
                tumorBam = tumorBam,
                tumorIndex = tumorIndex,
                normalBam = select_first([controlBam]),
                normalIndex = select_first([controlIndex]),
                ref = ref,
                mutect2VCF = mutect2.outputVCF,
                vardictVCF = vardict.outputVCF,
                strelkaSNV = strelka.variantsVCF,
                strelkaIndel = strelka.indelsVCF
        }
    }

    if (! defined(controlBam)) {
        call somaticSeqTask.SsSomaticSeqWrapper as ssSomaticSeq {
            input:
                outputDir = somaticSeqDir,
                bam = tumorBam,
                bamIndex = tumorIndex,
                ref = ref,
                mutect2VCF = mutect2.outputVCF,
                vardictVCF = vardict.outputVCF,
                strelkaVCF = strelka.variantsVCF,
        }
    }

    output {
        File mutect2Vcf = mutect2.outputVCF
        File mutect2Index = mutect2.outputVCFindex
        File vardictVcf = vardict.outputVCF
        File vardictIndex = vardict.outputVCFindex
        File strelkaSnvsVcf = strelka.variantsVCF
        File strelkaSnvsIndex = strelka.variantsVCFindex
        File? strelkaIndelsVcf = strelka.indelsVCF
        File? strelkaIndelsIndex = strelka.indelsVCFindex
        File? mantaVcf = strelka.mantaVCF
        File? mantaIndex = strelka.mantaVCFindex
    }
}