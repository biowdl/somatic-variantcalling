version 1.0

import "mutect2.wdl" as mutect2Workflow
import "tasks/samtools.wdl" as samtools
import "tasks/somaticseq.wdl" as somaticSeqTask
import "strelka.wdl" as strelkaWorkflow
import "structs.wdl" as structs
import "vardict.wdl" as vardictWorkflow

workflow SomaticVariantcalling {
    input {
        String outputDir = "."
        File referenceFasta
        File referenceFastaFai
        File referenceFastaDict
        String tumorSample
        File tumorBam
        File tumorBamIndex
        String? controlSample
        File? controlBam
        File? controlBamIndex
        TrainingSet? trainingSet
        File? regions

        Boolean runStrelka = true
        Boolean runVardict = true
        Boolean runMutect2 = true

        Map[String, String] dockerImages = {
            "picard":"quay.io/biocontainers/picard:2.18.26--0",
            "biopet-scatterregions":"quay.io/biocontainers/biopet-scatterregions:0.2--0",
            "tabix":"quay.io/biocontainers/tabix:0.2.6--ha92aebf_0",
            "manta": "quay.io/biocontainers/manta:1.4.0--py27_1",
            "strelka": "quay.io/biocontainers/strelka:2.9.7--0",
            "gatk4":"quay.io/biocontainers/gatk4:4.1.0.0--0",
            "vardict-java": "quay.io/biocontainers/vardict-java:1.5.8--1",
            "somaticseq": "lethalfang/somaticseq:3.1.0"
        }

        IndexedVcfFile? DONOTDEFINETHIS #FIXME
    }

    String mutect2Dir = outputDir + "/mutect2"
    String strelkaDir = outputDir + "/strelka"
    String vardictDir = outputDir + "/vardict"
    String somaticSeqDir = outputDir + "/somaticSeq"

    if (runMutect2) {
        call mutect2Workflow.Mutect2 as mutect2 {
            input:
                tumorSample = tumorSample,
                tumorBam = tumorBam,
                tumorBamIndex = tumorBamIndex,
                controlSample = controlSample,
                controlBam = controlBam,
                controlBamIndex = controlBamIndex,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                referenceFastaDict = referenceFastaDict,
                outputDir = mutect2Dir,
                regions = regions,
                dockerImages = dockerImages
        }
    }

    if (runStrelka) {
        call strelkaWorkflow.Strelka as strelka {
            input:
                controlBam = controlBam,
                controlBamIndex = controlBamIndex,
                tumorBam = tumorBam,
                tumorBamIndex = tumorBamIndex,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                referenceFastaDict = referenceFastaDict,
                outputDir = strelkaDir,
                basename = if defined(controlBam)
                    then "${tumorSample}-${controlSample}"
                    else tumorSample,
                regions = regions,
                dockerImages = dockerImages
        }
    }

    if (runVardict) {
        call vardictWorkflow.VarDict as vardict {
            input:
                tumorSample = tumorSample,
                tumorBam = tumorBam,
                tumorBamIndex = tumorBamIndex,
                controlSample = controlSample,
                controlBam = controlBam,
                controlBamIndex = controlBamIndex,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                referenceFastaDict = referenceFastaDict,
                outputDir = vardictDir,
                regions = regions,
                dockerImages = dockerImages
        }
    }

    if (defined(trainingSet) && defined(controlBam)) {
        #FIXME workaround for faulty 'no such field' errors which occur when a Struct is optional
        TrainingSet trainSetPaired = select_first([trainingSet])

        call somaticSeqTask.ParallelPairedTrain as pairedTraining {
            input:
                truthSNV = trainSetPaired.truthSNV,
                truthIndel = trainSetPaired.truthIndel,
                outputDir = somaticSeqDir + "/train",
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                inclusionRegion = regions,
                tumorBam = trainSetPaired.tumorBam,
                tumorBamIndex = trainSetPaired.tumorBamIndex,
                normalBam = select_first([trainSetPaired.normalBam]),
                normalBamIndex = select_first([trainSetPaired.normalBamIndex]),
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
                strelkaIndel = trainSetPaired.strelkaIndel,
                dockerImage = dockerImages["somaticseq"]
        }
    }

    if (defined(controlBam)) {
        call somaticSeqTask.ParallelPaired as pairedSomaticSeq {
            input:
                classifierSNV = pairedTraining.ensembleSNVClassifier,
                classifierIndel = pairedTraining.ensembleIndelsClassifier,
                outputDir = somaticSeqDir,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                inclusionRegion = regions,
                tumorBam = tumorBam,
                tumorBamIndex = tumorBamIndex,
                normalBam = select_first([controlBam]),
                normalBamIndex = select_first([controlBamIndex]),
                mutect2VCF = mutect2.outputVcf,
                vardictVCF = vardict.outputVcf,
                strelkaSNV = strelka.variantsVcf,
                strelkaIndel = strelka.indelsVcf,
                dockerImage = dockerImages["somaticseq"]
        }
    }

    if (defined(trainingSet) && !defined(controlBam)) {
        #FIXME workaround for faulty 'no such field' errors which occur when a Struct is optional
        TrainingSet trainSetSingle = select_first([trainingSet])

        call somaticSeqTask.ParallelSingleTrain as singleTraining {
            input:
                truthSNV = trainSetSingle.truthSNV,
                truthIndel = trainSetSingle.truthIndel,
                outputDir = somaticSeqDir + "/train",
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                inclusionRegion = regions,
                bam = trainSetSingle.tumorBam,
                bamIndex = trainSetSingle.tumorBamIndex,
                mutect2VCF = trainSetSingle.mutect2VCF,
                varscanVCF = trainSetSingle.varscanSNV,
                vardictVCF = trainSetSingle.vardictVCF,
                lofreqVCF = trainSetSingle.lofreqSNV,
                scalpelVCF = trainSetSingle.scalpelVCF,
                strelkaVCF = trainSetSingle.strelkaSNV,
                dockerImage = dockerImages["somaticseq"]
        }
    }

    if (!defined(controlBam)) {
        call somaticSeqTask.ParallelSingle as singleSomaticSeq {
            input:
                classifierSNV = singleTraining.ensembleSNVClassifier,
                classifierIndel = singleTraining.ensembleIndelsClassifier,
                outputDir = somaticSeqDir,
                referenceFasta = referenceFasta,
                referenceFastaFai = referenceFastaFai,
                inclusionRegion = regions,
                bam = tumorBam,
                bamIndex = tumorBamIndex,
                mutect2VCF = mutect2.outputVcf,
                vardictVCF = vardict.outputVcf,
                strelkaVCF = strelka.variantsVcf,
                dockerImage = dockerImages["somaticseq"]
        }
    }

    call samtools.BgzipAndIndex as snvIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then pairedSomaticSeq.snvs
                else singleSomaticSeq.snvs]),
            outputDir = somaticSeqDir,
            dockerImage = dockerImages["tabix"]
    }

    call samtools.BgzipAndIndex as indelIndex {
        input:
            inputFile = select_first([if defined(controlBam)
                then pairedSomaticSeq.indels
                else singleSomaticSeq.indels]),
            outputDir = somaticSeqDir,
            dockerImage = dockerImages["tabix"]

    }

    output{
        File somaticSeqSnvVcf =  snvIndex.compressed
        File somaticSeqSnvVcfIndex = snvIndex.index
        File somaticSeqIndelVcf = indelIndex.compressed
        File somaticSeqIndelVcfIndex = indelIndex.index
        File? mutect2Vcf = mutect2.outputVcf
        File? mutect2VcfIndex = mutect2.outputVcfIndex
        File? vardictVcf = vardict.outputVcf
        File? vardictVcfIndex = vardict.outputVcfIndex
        File? strelkaSnvsVcf = strelka.variantsVcf
        File? strelkaSnvsVcfIndex = strelka.variantsVcfIndex
        File? strelkaIndelsVcf = strelka.indelsVcf
        File? strelkaIndelsVcfIndex = strelka.indelsVcfIndex
        File? mantaVcf = strelka.mantaVcf
        File? mantaVcfIndex = strelka.mantaVcfIndex
    }
}