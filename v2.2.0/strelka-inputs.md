---
layout: default
title: "Inputs: Strelka"
---

# Inputs for Strelka

The following is an overview of all available inputs in
Strelka.


## Required inputs
<dl>
<dt id="Strelka.referenceFasta"><a href="#Strelka.referenceFasta">Strelka.referenceFasta</a></dt>
<dd>
    <i>File </i><br />
    The reference fasta file.
</dd>
<dt id="Strelka.referenceFastaDict"><a href="#Strelka.referenceFastaDict">Strelka.referenceFastaDict</a></dt>
<dd>
    <i>File </i><br />
    Sequence dictionary (.dict) file of the reference.
</dd>
<dt id="Strelka.referenceFastaFai"><a href="#Strelka.referenceFastaFai">Strelka.referenceFastaFai</a></dt>
<dd>
    <i>File </i><br />
    Fasta index (.fai) file of the reference.
</dd>
<dt id="Strelka.tumorBam"><a href="#Strelka.tumorBam">Strelka.tumorBam</a></dt>
<dd>
    <i>File </i><br />
    The BAM file for the tumor/case sample.
</dd>
<dt id="Strelka.tumorBamIndex"><a href="#Strelka.tumorBamIndex">Strelka.tumorBamIndex</a></dt>
<dd>
    <i>File </i><br />
    The index for the tumor/case sample's BAM file.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="Strelka.basename"><a href="#Strelka.basename">Strelka.basename</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"strelka"</code><br />
    The basename for the output.
</dd>
<dt id="Strelka.controlBam"><a href="#Strelka.controlBam">Strelka.controlBam</a></dt>
<dd>
    <i>File? </i><br />
    The BAM file for the normal/control sample.
</dd>
<dt id="Strelka.controlBamIndex"><a href="#Strelka.controlBamIndex">Strelka.controlBamIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the normal/control sample's BAM file.
</dd>
<dt id="Strelka.exome"><a href="#Strelka.exome">Strelka.exome</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the data is from exome sequencing.
</dd>
<dt id="Strelka.outputDir"><a href="#Strelka.outputDir">Strelka.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory to which the outputs will be written.
</dd>
<dt id="Strelka.regions"><a href="#Strelka.regions">Strelka.regions</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing the regions to operate on.
</dd>
<dt id="Strelka.rna"><a href="#Strelka.rna">Strelka.rna</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the data is from RNA sequencing.
</dd>
<dt id="Strelka.runManta"><a href="#Strelka.runManta">Strelka.runManta</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not manta should be run.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="Strelka.addGTFieldIndels.outputVCFName"><a href="#Strelka.addGTFieldIndels.outputVCFName">Strelka.addGTFieldIndels.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="Strelka.addGTFieldIndels.timeMinutes"><a href="#Strelka.addGTFieldIndels.timeMinutes">Strelka.addGTFieldIndels.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.addGTFieldSVs.outputVCFName"><a href="#Strelka.addGTFieldSVs.outputVCFName">Strelka.addGTFieldSVs.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="Strelka.addGTFieldSVs.timeMinutes"><a href="#Strelka.addGTFieldSVs.timeMinutes">Strelka.addGTFieldSVs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.addGTFieldVariants.outputVCFName"><a href="#Strelka.addGTFieldVariants.outputVCFName">Strelka.addGTFieldVariants.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="Strelka.addGTFieldVariants.timeMinutes"><a href="#Strelka.addGTFieldVariants.timeMinutes">Strelka.addGTFieldVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.bedPrepare.timeMinutes"><a href="#Strelka.bedPrepare.timeMinutes">Strelka.bedPrepare.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.combineVariants.dockerImage"><a href="#Strelka.combineVariants.dockerImage">Strelka.combineVariants.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"broadinstitute/gatk3:3.8-1"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="Strelka.combineVariants.filteredRecordsMergeType"><a href="#Strelka.combineVariants.filteredRecordsMergeType">Strelka.combineVariants.filteredRecordsMergeType</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"KEEP_IF_ANY_UNFILTERED"</code><br />
    Equivalent to CombineVariants' `--filteredrecordsmergetype` option.
</dd>
<dt id="Strelka.combineVariants.genotypeMergeOption"><a href="#Strelka.combineVariants.genotypeMergeOption">Strelka.combineVariants.genotypeMergeOption</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"UNIQUIFY"</code><br />
    Equivalent to CombineVariants' `--genotypemergeoption` option.
</dd>
<dt id="Strelka.combineVariants.javaXmx"><a href="#Strelka.combineVariants.javaXmx">Strelka.combineVariants.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Strelka.combineVariants.memory"><a href="#Strelka.combineVariants.memory">Strelka.combineVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Strelka.combineVariants.timeMinutes"><a href="#Strelka.combineVariants.timeMinutes">Strelka.combineVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>180</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.dockerImages"><a href="#Strelka.dockerImages">Strelka.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"picard": "quay.io/biocontainers/picard:2.23.2--0", "chunked-scatter": "quay.io/biocontainers/chunked-scatter:1.0.0--py_0", "tabix": "quay.io/biocontainers/tabix:0.2.6--ha92aebf_0", "manta": "quay.io/biocontainers/manta:1.4.0--py27_1", "strelka": "quay.io/biocontainers/strelka:2.9.7--0", "somaticseq": "lethalfang/somaticseq:3.1.0"}</code><br />
    The docker images used. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="Strelka.gatherIndels.compressionLevel"><a href="#Strelka.gatherIndels.compressionLevel">Strelka.gatherIndels.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written
</dd>
<dt id="Strelka.gatherIndels.javaXmx"><a href="#Strelka.gatherIndels.javaXmx">Strelka.gatherIndels.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Strelka.gatherIndels.memory"><a href="#Strelka.gatherIndels.memory">Strelka.gatherIndels.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Strelka.gatherIndels.timeMinutes"><a href="#Strelka.gatherIndels.timeMinutes">Strelka.gatherIndels.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.gatherIndels.useJdkDeflater"><a href="#Strelka.gatherIndels.useJdkDeflater">Strelka.gatherIndels.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="Strelka.gatherIndels.useJdkInflater"><a href="#Strelka.gatherIndels.useJdkInflater">Strelka.gatherIndels.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="Strelka.gatherSVs.compressionLevel"><a href="#Strelka.gatherSVs.compressionLevel">Strelka.gatherSVs.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written
</dd>
<dt id="Strelka.gatherSVs.javaXmx"><a href="#Strelka.gatherSVs.javaXmx">Strelka.gatherSVs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Strelka.gatherSVs.memory"><a href="#Strelka.gatherSVs.memory">Strelka.gatherSVs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Strelka.gatherSVs.timeMinutes"><a href="#Strelka.gatherSVs.timeMinutes">Strelka.gatherSVs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.gatherSVs.useJdkDeflater"><a href="#Strelka.gatherSVs.useJdkDeflater">Strelka.gatherSVs.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="Strelka.gatherSVs.useJdkInflater"><a href="#Strelka.gatherSVs.useJdkInflater">Strelka.gatherSVs.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="Strelka.gatherVariants.compressionLevel"><a href="#Strelka.gatherVariants.compressionLevel">Strelka.gatherVariants.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written
</dd>
<dt id="Strelka.gatherVariants.javaXmx"><a href="#Strelka.gatherVariants.javaXmx">Strelka.gatherVariants.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Strelka.gatherVariants.memory"><a href="#Strelka.gatherVariants.memory">Strelka.gatherVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Strelka.gatherVariants.timeMinutes"><a href="#Strelka.gatherVariants.timeMinutes">Strelka.gatherVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.gatherVariants.useJdkDeflater"><a href="#Strelka.gatherVariants.useJdkDeflater">Strelka.gatherVariants.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="Strelka.gatherVariants.useJdkInflater"><a href="#Strelka.gatherVariants.useJdkInflater">Strelka.gatherVariants.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="Strelka.indelsIndex.timeMinutes"><a href="#Strelka.indelsIndex.timeMinutes">Strelka.indelsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.mantaSomatic.cores"><a href="#Strelka.mantaSomatic.cores">Strelka.mantaSomatic.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="Strelka.mantaSomatic.memoryGb"><a href="#Strelka.mantaSomatic.memoryGb">Strelka.mantaSomatic.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="Strelka.mantaSomatic.timeMinutes"><a href="#Strelka.mantaSomatic.timeMinutes">Strelka.mantaSomatic.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.runCombineVariants"><a href="#Strelka.runCombineVariants">Strelka.runCombineVariants</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not found variants should be combined into a single VCf file.
</dd>
<dt id="Strelka.scatterList.memory"><a href="#Strelka.scatterList.memory">Strelka.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Strelka.scatterList.prefix"><a href="#Strelka.scatterList.prefix">Strelka.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"scatters/scatter-"</code><br />
    The prefix of the ouput files. Output will be named like: <PREFIX><N>.bed, in which N is an incrementing number. Default 'scatter-'.
</dd>
<dt id="Strelka.scatterList.timeMinutes"><a href="#Strelka.scatterList.timeMinutes">Strelka.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.scatterSize"><a href="#Strelka.scatterSize">Strelka.scatterSize</a></dt>
<dd>
    <i>Int? </i><br />
    The size of the scattered regions in bases. Scattering is used to speed up certain processes. The genome will be seperated into multiple chunks (scatters) which will be processed in their own job, allowing for parallel processing. Higher values will result in a lower number of jobs. The optimal value here will depend on the available resources.
</dd>
<dt id="Strelka.scatterSizeMillions"><a href="#Strelka.scatterSizeMillions">Strelka.scatterSizeMillions</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1000</code><br />
    Same as scatterSize, but is multiplied by 1000000 to get scatterSize. This allows for setting larger values more easily
</dd>
<dt id="Strelka.strelkaGermline.cores"><a href="#Strelka.strelkaGermline.cores">Strelka.strelkaGermline.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="Strelka.strelkaGermline.memoryGb"><a href="#Strelka.strelkaGermline.memoryGb">Strelka.strelkaGermline.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="Strelka.strelkaGermline.timeMinutes"><a href="#Strelka.strelkaGermline.timeMinutes">Strelka.strelkaGermline.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>90</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.strelkaSomatic.cores"><a href="#Strelka.strelkaSomatic.cores">Strelka.strelkaSomatic.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="Strelka.strelkaSomatic.memoryGb"><a href="#Strelka.strelkaSomatic.memoryGb">Strelka.strelkaSomatic.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="Strelka.strelkaSomatic.timeMinutes"><a href="#Strelka.strelkaSomatic.timeMinutes">Strelka.strelkaSomatic.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>90</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.svsIndex.timeMinutes"><a href="#Strelka.svsIndex.timeMinutes">Strelka.svsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Strelka.variantsIndex.timeMinutes"><a href="#Strelka.variantsIndex.timeMinutes">Strelka.variantsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
</dl>
</details>





## Do not set these inputs!
The following inputs should ***not*** be set, even though womtool may
show them as being available inputs.

* Strelka.indelsIndex.type
* Strelka.svsIndex.type
* Strelka.variantsIndex.type
* Strelka.strelkaSomatic.doNotDefineThis
