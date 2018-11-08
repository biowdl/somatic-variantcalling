version 1.0

import "mutect2.wdl" as mutect2Workflow
import "tasks/common.wdl" as common
import "tasks/samtools.wdl" as samtools
import "tasks/somaticseq.wdl" as somaticSeqTask
import "strelka.wdl" as strelkaWorkflow
import "vardict.wdl" as vardictWorkflow

workflow SomaticVariantcalling {
    input {
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        Reference reference

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
            controlSample = controlSample,
            controlBam = controlBam,
            reference = reference,
            vcfPath = if defined(controlBam)
                then "${mutect2Dir}/${tumorSample}-${controlSample}.vcf.gz"
                else "${mutect2Dir}/${tumorSample}.vcf.gz"
    }

    call strelkaWorkflow.Strelka as strelka {
        input:
            controlBam = controlBam,
            tumorBam = tumorBam,
            reference = reference,
            outputDir = strelkaDir,
            basename = if defined(controlBam)
                then "${tumorSample}-${controlSample}"
                else tumorSample
    }

    call vardictWorkflow.VarDict as vardict {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            controlSample = controlSample,
            controlBam = controlBam,
            reference = reference,
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

    call samtools.BgzipAndIndex as snvIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then somaticSeq.consensusSNV
                else ssSomaticSeq.consensusSNV]),
            outputDir = somaticSeqDir
    }

    call samtools.BgzipAndIndex as indelIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then somaticSeq.consensusIndels
                else ssSomaticSeq.consensusIndels]),
            outputDir = somaticSeqDir
    }

    output{
        IndexedVcfFile mutect2Vcf = mutect2.outputVCF
        IndexedVcfFile vardictVcf = vardict.outputVCF
        IndexedVcfFile strelkaSnvsVcf = strelka.variantsVCF
        IndexedVcfFile? strelkaIndelsVcf = strelka.indelsVCF
        IndexedVcfFile? mantaVcf = strelka.mantaVCF
    }
}