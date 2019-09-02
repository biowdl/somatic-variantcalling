---
layout: default
title: Home
---

This workflow uses several programs to call somatic variants and 
aggregate the results.
- strelka
- mutect2
- vardict
- manta
- somaticseq

This workflow is part of [BioWDL](https://biowdl.github.io/)
developed by the SASC team at [Leiden University Medical Center](https://www.lumc.nl/).

## Usage
This workflow can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```bash
java -jar cromwell-<version>.jar run -i inputs.json somatic-variantcalling.wdl
```

### Inputs
Inputs are provided through a JSON file. The minimally required inputs are
described below and a template containing all possible inputs can be generated
using Womtool as described in the
[WOMtool documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/). See
[this page](/inputs.html) for some additional general notes and information
about pipeline inputs.
```json
{
  "SomaticVariantcalling.tumorBam": "The bam file to be processed",
  "SomaticVariantcalling.tumorBamIndex": "The bam file's index",
  "SomaticVariantcalling.tumorSample": "Name of the sample. This name will be used as a basename for the outputs.",
  "SomaticVariantcalling.referenceFasta": "A reference fasta file",
  "SomaticVariantcalling.referenceFastaFai": "The index for the reference fasta",
  "SomaticVariantcalling.referenceFastaDict": "The dict file for the reference fasta"
}
```

Some additional inputs that may be of interest are:
```json
{
  "SomaticVariantcalling.controlBam": "A control (not tumor) sample bam file",
  "SomaticVariantcalling.controlBamIndex": "Index of the control bam file",
  "SomaticVariantcalling.controlSample": "Name of the control sample. Used as a basename for the outputs.",
  "SomaticVariantcalling.trainingSet": "A training set for SomaticSeq",
  "SomaticVariantcalling.runCombineVariants": "A boolean that notes whether the variant vcfs should be combined."
}
```

An output directory can be set using an `options.json` file. See [the
cromwell documentation](
https://cromwell.readthedocs.io/en/stable/wf_options/Overview/) for more
information.

Example `options.json` file:
```JSON
{
"final_workflow_outputs_dir": "my-analysis-output",
"use_relative_output_paths": true,
"default_runtime_attributes": {
  "docker_user": "$EUID"
  }
}
```
Alternatively an output directory can be set with `GatkPreprocess.outputDir`.
`GatkPreprocess.outputDir` must be mounted in the docker container. Cromwell will
need a custom configuration to allow this.

#### Example
```json
{
  "SomaticVariantcalling.tumorSample": "wgs3",
  "SomaticVariantcalling.tumorBam": "tests/data/wgs3/wgs3.bam",
  "SomaticVariantcalling.tumorBamIndex": "tests/data/wgs3/wgs3.bai",
  "SomaticVariantcalling.referenceFasta": "tests/data/reference/reference.fasta",
  "SomaticVariantcalling.referenceFastaFai": "tests/data/reference/reference.fasta.fai",
  "SomaticVariantcalling.referenceFastaDict": "tests/data/reference/reference.dict",
  "SomaticVariantcalling.trainingSet": {
    "truthIndel": "tests/data/wgs3/wgs3_indel_subset.vcf.gz",
    "truthSNV": "tests/data/wgs3/wgs3_snv_subset.vcf.gz",
    "tumorBam": "tests/data/wgs3/wgs3.bam",
    "tumorBamIndex": "tests/data/wgs3/wgs3.bai",
    "mutect2VCF": "tests/data/wgs3/somatic_variantcalling_vcfs/paired/mutect2/wgs3-wgs1.vcf.gz",
    "vardictVCF": "tests/data/wgs3/somatic_variantcalling_vcfs/paired/vardict/wgs3-wgs1.vcf.gz",
    "strelkaSNV": "tests/data/wgs3/somatic_variantcalling_vcfs/paired/strelka/strelka_variants.vcf.gz"
  },
  "SomaticVariantcalling.runCombineVariants": true
}
```

### Dependency requirements and tool versions
Biowdl pipelines use docker images to ensure  reproducibility. This
means that biowdl pipelines will run on any system that has docker
installed. Alternatively they can be run with singularity.

For more advanced configuration of docker or singularity please check
the [cromwell documentation on containers](
https://cromwell.readthedocs.io/en/stable/tutorials/Containers/).

Images from [biocontainers](https://biocontainers.pro) are preferred for
biowdl pipelines. The list of default images for this pipeline can be
found in the default for the `dockerImages` input.

### Output
VCF files for each of the variant callers and a combined variants file.

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any question about running this workflow or feature requests, please use
the
<a href='https://github.com/biowdl/jointgenotyping/issues'>github issue tracker</a>
or contact the SASC team directly at: <a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
