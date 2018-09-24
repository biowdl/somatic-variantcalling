version 1.0

import "mutect2.wdl" as mutect2Workflow
import "strelka.wdl" as strelkaWorkflow
import "vardict.wdl" as vardictWorkflow
import "tasks/common.wdl" as common

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

    #TODO some kind of merging (SomaticSeq?)
    #TODO metrics?

    output{
        IndexedVcfFile mutect2Vcf = mutect2.outputVCF
        IndexedVcfFile vardictVcf = vardict.outputVCF
        IndexedVcfFile strelkaSnvsVcf = strelka.variantsVCF
        IndexedVcfFile? strelkaIndelsVcf = strelka.indelsVCF
        IndexedVcfFile? mantaVcf = strelka.mantaVCF
    }
}