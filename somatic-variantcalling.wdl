version 1.0

import "mutect2.wdl" as mutect2Workflow
import "tasks/common.wdl" as common
import "tasks/samtools.wdl" as samtools
import "tasks/somaticseq.wdl" as somaticSeqTask
import "strelka.wdl" as strelkaWorkflow
import "structs.wdl" as structs
import "vardict.wdl" as vardictWorkflow

workflow SomaticVariantcalling {
    input {
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        Reference reference
        TrainingSet? trainingSet
        File? regions

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
            outputDir = mutect2Dir,
            regions = regions
    }

    call strelkaWorkflow.Strelka as strelka {
        input:
            controlBam = controlBam,
            tumorBam = tumorBam,
            reference = reference,
            outputDir = strelkaDir,
            basename = if defined(controlBam)
                then "${tumorSample}-${controlSample}"
                else tumorSample,
            regions = regions
    }

    call vardictWorkflow.VarDict as vardict {
        input:
            tumorSample = tumorSample,
            tumorBam = tumorBam,
            controlSample = controlSample,
            controlBam = controlBam,
            reference = reference,
            outputDir = vardictDir,
            regions = regions
    }

    if (defined(trainingSet) && defined(controlBam)) {
        TrainingSet trainSetPaired = select_first([trainingSet]) #FIXME workaround 'no such field'

        call somaticSeqTask.SomaticSeqParallelPairedTrain as pairedTraining {
            input:
                truthSNV = trainSetPaired.truthSNV,
                truthIndel = trainSetPaired.truthIndel,
                outputDir = somaticSeqDir + "/train",
                reference = reference,
                inclusionRegion = regions,
                tumorBam = trainSetPaired.tumorBam,
                normalBam = select_first([trainSetPaired.normalBam]),
                mutect2VCF = trainSetPaired.mutect2VCF,
                varscanSNV = trainSetPaired.varscanSNV,
                varscanIndel = trainSetPaired.varscanIndel,
                jsmVCF = trainSetPaired.jsmVCF,
                somaticsniperVCF = trainSetPaired.somaticsniperVCF,
                vardictVCF = trainSetPaired.vardictVCF,
                museVCF = trainSetPaired.museVCF,
                lofreqSNV = trainSetPaired.lofreqSNV,
                lofreqIndel = trainSetPaired.lofreqIndel,
                scalpelVCF = trainSetPaired.scalpelVCF,
                strelkaSNV = trainSetPaired.strelkaSNV,
                strelkaIndel = trainSetPaired.strelkaIndel
        }
    }

    if (defined(controlBam)) {
        call somaticSeqTask.SomaticSeqParallelPaired as pairedSomaticSeq {
            input:
                classifierSNV = pairedTraining.ensembleSNVClassifier,
                classifierIndel = pairedTraining.ensembleIndelsClassifier,
                outputDir = somaticSeqDir,
                reference = reference,
                inclusionRegion = regions,
                tumorBam = tumorBam,
                normalBam = select_first([controlBam]),
                mutect2VCF = mutect2.outputVCF.file,
                vardictVCF = vardict.outputVCF.file,
                strelkaSNV = strelka.variantsVCF.file,
                strelkaIndel = select_first([strelka.indelsVCF]).file
        }
    }

    if (defined(trainingSet) && !defined(controlBam)) {
        TrainingSet trainSetSingle = select_first([trainingSet]) #FIXME workaround 'no such field'

        call somaticSeqTask.SomaticSeqParallelSingleTrain as singleTraining {
            input:
                truthSNV = trainSetSingle.truthSNV,
                truthIndel = trainSetSingle.truthIndel,
                outputDir = somaticSeqDir + "/train",
                reference = reference,
                inclusionRegion = regions,
                bam = trainSetSingle.tumorBam,
                mutect2VCF = trainSetSingle.mutect2VCF,
                varscanVCF = trainSetSingle.varscanSNV,
                vardictVCF = trainSetSingle.vardictVCF,
                lofreqVCF = trainSetSingle.lofreqSNV,
                scalpelVCF = trainSetSingle.scalpelVCF,
                strelkaVCF = trainSetSingle.strelkaSNV
        }
    }

    if (!defined(controlBam)) {
        call somaticSeqTask.SomaticSeqParallelSingle as singleSomaticSeq {
            input:
                classifierSNV = singleTraining.ensembleSNVClassifier,
                classifierIndel = singleTraining.ensembleIndelsClassifier,
                outputDir = somaticSeqDir,
                reference = reference,
                inclusionRegion = regions,
                bam = tumorBam,
                mutect2VCF = mutect2.outputVCF.file,
                vardictVCF = vardict.outputVCF.file,
                strelkaVCF = strelka.variantsVCF.file,
        }
    }

    call samtools.BgzipAndIndex as snvIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then pairedSomaticSeq.snvs
                else singleSomaticSeq.snvs]),
            outputDir = somaticSeqDir
    }

    call samtools.BgzipAndIndex as indelIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then pairedSomaticSeq.indels
                else singleSomaticSeq.indels]),
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