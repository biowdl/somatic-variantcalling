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
            outputDir = mutect2Dir
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
            outputDir = vardictDir
    }

    if (defined(controlBam)) {
        IndexedVcfFile strelkaIndel = select_first([strelka.indelsVCF])

        call somaticSeqTask.SomaticSeqWrapper as somaticSeq {
            input:
                outputDir = somaticSeqDir,
                tumorBam = tumorBam,
                normalBam = select_first([controlBam]),
                reference = reference,
                mutect2VCF = mutect2.outputVCF.file,
                vardictVCF = vardict.outputVCF.file,
                strelkaSNV = strelka.variantsVCF.file,
                strelkaIndel = strelkaIndel.file
        }
    }

    if (! defined(controlBam)) {
        call somaticSeqTask.SsSomaticSeqWrapper as ssSomaticSeq {
            input:
                outputDir = somaticSeqDir,
                bam = tumorBam,
                reference = reference,
                mutect2VCF = mutect2.outputVCF.file,
                vardictVCF = vardict.outputVCF.file,
                strelkaVCF = strelka.variantsVCF.file,
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
        IndexedVcfFile somaticSeqSnvVcf =  object {
            file: snvIndex.compressed,
            index: snvIndex.index
        }
        IndexedVcfFile somaticSeqIndelVcf =  object {
            file: indelIndex.compressed,
            index: indelIndex.index
        }
        IndexedVcfFile mutect2Vcf = mutect2.outputVCF
        IndexedVcfFile vardictVcf = vardict.outputVCF
        IndexedVcfFile strelkaSnvsVcf = strelka.variantsVCF
        IndexedVcfFile? strelkaIndelsVcf = strelka.indelsVCF
        IndexedVcfFile? mantaVcf = strelka.mantaVCF
    }
}