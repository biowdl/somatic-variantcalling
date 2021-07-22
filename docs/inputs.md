---
layout: default
title: "Inputs: SomaticVariantcalling"
---

# Inputs for SomaticVariantcalling

The following is an overview of all available inputs in
SomaticVariantcalling.


## Required inputs
<dl>
<dt id="SomaticVariantcalling.referenceFasta"><a href="#SomaticVariantcalling.referenceFasta">SomaticVariantcalling.referenceFasta</a></dt>
<dd>
    <i>File </i><br />
    The reference fasta file.
</dd>
<dt id="SomaticVariantcalling.referenceFastaDict"><a href="#SomaticVariantcalling.referenceFastaDict">SomaticVariantcalling.referenceFastaDict</a></dt>
<dd>
    <i>File </i><br />
    Sequence dictionary (.dict) file of the reference.
</dd>
<dt id="SomaticVariantcalling.referenceFastaFai"><a href="#SomaticVariantcalling.referenceFastaFai">SomaticVariantcalling.referenceFastaFai</a></dt>
<dd>
    <i>File </i><br />
    Fasta index (.fai) file of the reference.
</dd>
<dt id="SomaticVariantcalling.tumorBam"><a href="#SomaticVariantcalling.tumorBam">SomaticVariantcalling.tumorBam</a></dt>
<dd>
    <i>File </i><br />
    The BAM file for the tumor/case sample.
</dd>
<dt id="SomaticVariantcalling.tumorBamIndex"><a href="#SomaticVariantcalling.tumorBamIndex">SomaticVariantcalling.tumorBamIndex</a></dt>
<dd>
    <i>File </i><br />
    The index for the tumor/case sample's BAM file.
</dd>
<dt id="SomaticVariantcalling.tumorSample"><a href="#SomaticVariantcalling.tumorSample">SomaticVariantcalling.tumorSample</a></dt>
<dd>
    <i>String </i><br />
    The name of the tumor/case sample.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="SomaticVariantcalling.controlBam"><a href="#SomaticVariantcalling.controlBam">SomaticVariantcalling.controlBam</a></dt>
<dd>
    <i>File? </i><br />
    The BAM file for the normal/control sample.
</dd>
<dt id="SomaticVariantcalling.controlBamIndex"><a href="#SomaticVariantcalling.controlBamIndex">SomaticVariantcalling.controlBamIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the normal/control sample's BAM file.
</dd>
<dt id="SomaticVariantcalling.controlSample"><a href="#SomaticVariantcalling.controlSample">SomaticVariantcalling.controlSample</a></dt>
<dd>
    <i>String? </i><br />
    The name of the normal/control sample.
</dd>
<dt id="SomaticVariantcalling.outputDir"><a href="#SomaticVariantcalling.outputDir">SomaticVariantcalling.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory to which the outputs will be written.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.exclusionRegion"><a href="#SomaticVariantcalling.pairedSomaticSeq.exclusionRegion">SomaticVariantcalling.pairedSomaticSeq.exclusionRegion</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing regions to exclude.
</dd>
<dt id="SomaticVariantcalling.pairedTraining.exclusionRegion"><a href="#SomaticVariantcalling.pairedTraining.exclusionRegion">SomaticVariantcalling.pairedTraining.exclusionRegion</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing regions to exclude.
</dd>
<dt id="SomaticVariantcalling.regions"><a href="#SomaticVariantcalling.regions">SomaticVariantcalling.regions</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing the regions to operate on.
</dd>
<dt id="SomaticVariantcalling.runManta"><a href="#SomaticVariantcalling.runManta">SomaticVariantcalling.runManta</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not manta should be run as part of the Strelka pipeline.
</dd>
<dt id="SomaticVariantcalling.runMutect2"><a href="#SomaticVariantcalling.runMutect2">SomaticVariantcalling.runMutect2</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not to run Mutect2.
</dd>
<dt id="SomaticVariantcalling.runStrelka"><a href="#SomaticVariantcalling.runStrelka">SomaticVariantcalling.runStrelka</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not to run Strelka.
</dd>
<dt id="SomaticVariantcalling.runVardict"><a href="#SomaticVariantcalling.runVardict">SomaticVariantcalling.runVardict</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not to run VarDict.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.exclusionRegion"><a href="#SomaticVariantcalling.singleSomaticSeq.exclusionRegion">SomaticVariantcalling.singleSomaticSeq.exclusionRegion</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing regions to exclude.
</dd>
<dt id="SomaticVariantcalling.singleTraining.exclusionRegion"><a href="#SomaticVariantcalling.singleTraining.exclusionRegion">SomaticVariantcalling.singleTraining.exclusionRegion</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing regions to exclude.
</dd>
<dt id="SomaticVariantcalling.strelka.exome"><a href="#SomaticVariantcalling.strelka.exome">SomaticVariantcalling.strelka.exome</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the data is from exome sequencing.
</dd>
<dt id="SomaticVariantcalling.strelka.rna"><a href="#SomaticVariantcalling.strelka.rna">SomaticVariantcalling.strelka.rna</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the data is from RNA sequencing.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="SomaticVariantcalling.combineVariants.dockerImage"><a href="#SomaticVariantcalling.combineVariants.dockerImage">SomaticVariantcalling.combineVariants.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"broadinstitute/gatk3:3.8-1"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SomaticVariantcalling.combineVariants.filteredRecordsMergeType"><a href="#SomaticVariantcalling.combineVariants.filteredRecordsMergeType">SomaticVariantcalling.combineVariants.filteredRecordsMergeType</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"KEEP_IF_ANY_UNFILTERED"</code><br />
    Equivalent to CombineVariants' `--filteredrecordsmergetype` option.
</dd>
<dt id="SomaticVariantcalling.combineVariants.genotypeMergeOption"><a href="#SomaticVariantcalling.combineVariants.genotypeMergeOption">SomaticVariantcalling.combineVariants.genotypeMergeOption</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"UNIQUIFY"</code><br />
    Equivalent to CombineVariants' `--genotypemergeoption` option.
</dd>
<dt id="SomaticVariantcalling.combineVariants.javaXmx"><a href="#SomaticVariantcalling.combineVariants.javaXmx">SomaticVariantcalling.combineVariants.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.combineVariants.memory"><a href="#SomaticVariantcalling.combineVariants.memory">SomaticVariantcalling.combineVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.combineVariants.timeMinutes"><a href="#SomaticVariantcalling.combineVariants.timeMinutes">SomaticVariantcalling.combineVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>180</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.dockerImages"><a href="#SomaticVariantcalling.dockerImages">SomaticVariantcalling.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"picard": "quay.io/biocontainers/picard:2.23.2--0", "gatk4": "quay.io/biocontainers/gatk4:4.1.8.0--py38h37ae868_0", "chunked-scatter": "quay.io/biocontainers/chunked-scatter:1.0.0--py_0", "tabix": "quay.io/biocontainers/tabix:0.2.6--ha92aebf_0", "manta": "quay.io/biocontainers/manta:1.4.0--py27_1", "strelka": "quay.io/biocontainers/strelka:2.9.7--0", "vardict-java": "quay.io/biocontainers/vardict-java:1.5.8--1", "somaticseq": "lethalfang/somaticseq:3.1.0", "samtools": "quay.io/biocontainers/samtools:1.10--h9402c20_2"}</code><br />
    The docker images used. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SomaticVariantcalling.indelIndex.memory"><a href="#SomaticVariantcalling.indelIndex.memory">SomaticVariantcalling.indelIndex.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.indelIndex.timeMinutes"><a href="#SomaticVariantcalling.indelIndex.timeMinutes">SomaticVariantcalling.indelIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.calculateContamination.javaXmx"><a href="#SomaticVariantcalling.mutect2.calculateContamination.javaXmx">SomaticVariantcalling.mutect2.calculateContamination.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.calculateContamination.memory"><a href="#SomaticVariantcalling.mutect2.calculateContamination.memory">SomaticVariantcalling.mutect2.calculateContamination.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.calculateContamination.timeMinutes"><a href="#SomaticVariantcalling.mutect2.calculateContamination.timeMinutes">SomaticVariantcalling.mutect2.calculateContamination.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>180</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.filterMutectCalls.javaXmx"><a href="#SomaticVariantcalling.mutect2.filterMutectCalls.javaXmx">SomaticVariantcalling.mutect2.filterMutectCalls.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.filterMutectCalls.memory"><a href="#SomaticVariantcalling.mutect2.filterMutectCalls.memory">SomaticVariantcalling.mutect2.filterMutectCalls.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.filterMutectCalls.timeMinutes"><a href="#SomaticVariantcalling.mutect2.filterMutectCalls.timeMinutes">SomaticVariantcalling.mutect2.filterMutectCalls.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.filterMutectCalls.uniqueAltReadCount"><a href="#SomaticVariantcalling.mutect2.filterMutectCalls.uniqueAltReadCount">SomaticVariantcalling.mutect2.filterMutectCalls.uniqueAltReadCount</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to FilterMutectCalls' `--unique-alt-read-count` option.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.compressionLevel"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.compressionLevel">SomaticVariantcalling.mutect2.gatherVcfs.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.javaXmx"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.javaXmx">SomaticVariantcalling.mutect2.gatherVcfs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.memory"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.memory">SomaticVariantcalling.mutect2.gatherVcfs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.timeMinutes"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.timeMinutes">SomaticVariantcalling.mutect2.gatherVcfs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.useJdkDeflater"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.useJdkDeflater">SomaticVariantcalling.mutect2.gatherVcfs.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="SomaticVariantcalling.mutect2.gatherVcfs.useJdkInflater"><a href="#SomaticVariantcalling.mutect2.gatherVcfs.useJdkInflater">SomaticVariantcalling.mutect2.gatherVcfs.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesNormal.javaXmx"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesNormal.javaXmx">SomaticVariantcalling.mutect2.getPileupSummariesNormal.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesNormal.memory"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesNormal.memory">SomaticVariantcalling.mutect2.getPileupSummariesNormal.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesNormal.timeMinutes"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesNormal.timeMinutes">SomaticVariantcalling.mutect2.getPileupSummariesNormal.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesTumor.javaXmx"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesTumor.javaXmx">SomaticVariantcalling.mutect2.getPileupSummariesTumor.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesTumor.memory"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesTumor.memory">SomaticVariantcalling.mutect2.getPileupSummariesTumor.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.getPileupSummariesTumor.timeMinutes"><a href="#SomaticVariantcalling.mutect2.getPileupSummariesTumor.timeMinutes">SomaticVariantcalling.mutect2.getPileupSummariesTumor.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.learnReadOrientationModel.javaXmx"><a href="#SomaticVariantcalling.mutect2.learnReadOrientationModel.javaXmx">SomaticVariantcalling.mutect2.learnReadOrientationModel.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.learnReadOrientationModel.memory"><a href="#SomaticVariantcalling.mutect2.learnReadOrientationModel.memory">SomaticVariantcalling.mutect2.learnReadOrientationModel.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.learnReadOrientationModel.timeMinutes"><a href="#SomaticVariantcalling.mutect2.learnReadOrientationModel.timeMinutes">SomaticVariantcalling.mutect2.learnReadOrientationModel.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.mergeStats.javaXmx"><a href="#SomaticVariantcalling.mutect2.mergeStats.javaXmx">SomaticVariantcalling.mutect2.mergeStats.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"14G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.mergeStats.memory"><a href="#SomaticVariantcalling.mutect2.mergeStats.memory">SomaticVariantcalling.mutect2.mergeStats.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"15G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.mergeStats.timeMinutes"><a href="#SomaticVariantcalling.mutect2.mergeStats.timeMinutes">SomaticVariantcalling.mutect2.mergeStats.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>30</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.f1r2TarGz"><a href="#SomaticVariantcalling.mutect2.mutect2.f1r2TarGz">SomaticVariantcalling.mutect2.mutect2.f1r2TarGz</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"f1r2.tar.gz"</code><br />
    Equivalent to Mutect2's `--f1r2-tar-gz` option.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.germlineResource"><a href="#SomaticVariantcalling.mutect2.mutect2.germlineResource">SomaticVariantcalling.mutect2.mutect2.germlineResource</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to Mutect2's `--germline-resource` option.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.germlineResourceIndex"><a href="#SomaticVariantcalling.mutect2.mutect2.germlineResourceIndex">SomaticVariantcalling.mutect2.mutect2.germlineResourceIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the germline resource.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.javaXmx"><a href="#SomaticVariantcalling.mutect2.mutect2.javaXmx">SomaticVariantcalling.mutect2.mutect2.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.memory"><a href="#SomaticVariantcalling.mutect2.mutect2.memory">SomaticVariantcalling.mutect2.mutect2.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.outputStats"><a href="#SomaticVariantcalling.mutect2.mutect2.outputStats">SomaticVariantcalling.mutect2.mutect2.outputStats</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>outputVcf + ".stats"</code><br />
    The location the output statistics should be written to.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.panelOfNormals"><a href="#SomaticVariantcalling.mutect2.mutect2.panelOfNormals">SomaticVariantcalling.mutect2.mutect2.panelOfNormals</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to Mutect2's `--panel-of-normals` option.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.panelOfNormalsIndex"><a href="#SomaticVariantcalling.mutect2.mutect2.panelOfNormalsIndex">SomaticVariantcalling.mutect2.mutect2.panelOfNormalsIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the panel of normals.
</dd>
<dt id="SomaticVariantcalling.mutect2.mutect2.timeMinutes"><a href="#SomaticVariantcalling.mutect2.mutect2.timeMinutes">SomaticVariantcalling.mutect2.mutect2.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>240</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.scatterList.memory"><a href="#SomaticVariantcalling.mutect2.scatterList.memory">SomaticVariantcalling.mutect2.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.mutect2.scatterList.prefix"><a href="#SomaticVariantcalling.mutect2.scatterList.prefix">SomaticVariantcalling.mutect2.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"scatters/scatter-"</code><br />
    The prefix of the ouput files. Output will be named like: <PREFIX><N>.bed, in which N is an incrementing number. Default 'scatter-'.
</dd>
<dt id="SomaticVariantcalling.mutect2.scatterList.timeMinutes"><a href="#SomaticVariantcalling.mutect2.scatterList.timeMinutes">SomaticVariantcalling.mutect2.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.mutect2.scatterSize"><a href="#SomaticVariantcalling.mutect2.scatterSize">SomaticVariantcalling.mutect2.scatterSize</a></dt>
<dd>
    <i>Int? </i><br />
    The size of the scattered regions in bases. Scattering is used to speed up certain processes. The genome will be seperated into multiple chunks (scatters) which will be processed in their own job, allowing for parallel processing. Higher values will result in a lower number of jobs. The optimal value here will depend on the available resources.
</dd>
<dt id="SomaticVariantcalling.mutect2.scatterSizeMillions"><a href="#SomaticVariantcalling.mutect2.scatterSizeMillions">SomaticVariantcalling.mutect2.scatterSizeMillions</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1000</code><br />
    Same as scatterSize, but is multiplied by 1000000 to get scatterSize. This allows for setting larger values more easily
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.jsmVCF"><a href="#SomaticVariantcalling.pairedSomaticSeq.jsmVCF">SomaticVariantcalling.pairedSomaticSeq.jsmVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by jsm.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.lofreqIndel"><a href="#SomaticVariantcalling.pairedSomaticSeq.lofreqIndel">SomaticVariantcalling.pairedSomaticSeq.lofreqIndel</a></dt>
<dd>
    <i>File? </i><br />
    An indel VCF as produced by lofreq.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.lofreqSNV"><a href="#SomaticVariantcalling.pairedSomaticSeq.lofreqSNV">SomaticVariantcalling.pairedSomaticSeq.lofreqSNV</a></dt>
<dd>
    <i>File? </i><br />
    An SNV VCF as produced by lofreq.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.memory"><a href="#SomaticVariantcalling.pairedSomaticSeq.memory">SomaticVariantcalling.pairedSomaticSeq.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.museVCF"><a href="#SomaticVariantcalling.pairedSomaticSeq.museVCF">SomaticVariantcalling.pairedSomaticSeq.museVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by muse.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.scalpelVCF"><a href="#SomaticVariantcalling.pairedSomaticSeq.scalpelVCF">SomaticVariantcalling.pairedSomaticSeq.scalpelVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by scalpel.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.somaticsniperVCF"><a href="#SomaticVariantcalling.pairedSomaticSeq.somaticsniperVCF">SomaticVariantcalling.pairedSomaticSeq.somaticsniperVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by somaticsniper.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.threads"><a href="#SomaticVariantcalling.pairedSomaticSeq.threads">SomaticVariantcalling.pairedSomaticSeq.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.timeMinutes"><a href="#SomaticVariantcalling.pairedSomaticSeq.timeMinutes">SomaticVariantcalling.pairedSomaticSeq.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.varscanIndel"><a href="#SomaticVariantcalling.pairedSomaticSeq.varscanIndel">SomaticVariantcalling.pairedSomaticSeq.varscanIndel</a></dt>
<dd>
    <i>File? </i><br />
    An indel VCF as produced by varscan.
</dd>
<dt id="SomaticVariantcalling.pairedSomaticSeq.varscanSNV"><a href="#SomaticVariantcalling.pairedSomaticSeq.varscanSNV">SomaticVariantcalling.pairedSomaticSeq.varscanSNV</a></dt>
<dd>
    <i>File? </i><br />
    An SNV VCF as produced by varscan.
</dd>
<dt id="SomaticVariantcalling.pairedTraining.memory"><a href="#SomaticVariantcalling.pairedTraining.memory">SomaticVariantcalling.pairedTraining.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.pairedTraining.threads"><a href="#SomaticVariantcalling.pairedTraining.threads">SomaticVariantcalling.pairedTraining.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.pairedTraining.timeMinutes"><a href="#SomaticVariantcalling.pairedTraining.timeMinutes">SomaticVariantcalling.pairedTraining.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>240</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.runCombineVariants"><a href="#SomaticVariantcalling.runCombineVariants">SomaticVariantcalling.runCombineVariants</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not to combine the variant calling results into one VCF file.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.lofreqVCF"><a href="#SomaticVariantcalling.singleSomaticSeq.lofreqVCF">SomaticVariantcalling.singleSomaticSeq.lofreqVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by lofreq.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.memory"><a href="#SomaticVariantcalling.singleSomaticSeq.memory">SomaticVariantcalling.singleSomaticSeq.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.scalpelVCF"><a href="#SomaticVariantcalling.singleSomaticSeq.scalpelVCF">SomaticVariantcalling.singleSomaticSeq.scalpelVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by scalpel.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.threads"><a href="#SomaticVariantcalling.singleSomaticSeq.threads">SomaticVariantcalling.singleSomaticSeq.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.timeMinutes"><a href="#SomaticVariantcalling.singleSomaticSeq.timeMinutes">SomaticVariantcalling.singleSomaticSeq.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.singleSomaticSeq.varscanVCF"><a href="#SomaticVariantcalling.singleSomaticSeq.varscanVCF">SomaticVariantcalling.singleSomaticSeq.varscanVCF</a></dt>
<dd>
    <i>File? </i><br />
    A VCF as produced by varscan.
</dd>
<dt id="SomaticVariantcalling.singleTraining.memory"><a href="#SomaticVariantcalling.singleTraining.memory">SomaticVariantcalling.singleTraining.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.singleTraining.threads"><a href="#SomaticVariantcalling.singleTraining.threads">SomaticVariantcalling.singleTraining.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.singleTraining.timeMinutes"><a href="#SomaticVariantcalling.singleTraining.timeMinutes">SomaticVariantcalling.singleTraining.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>240</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.sitesForContamination"><a href="#SomaticVariantcalling.sitesForContamination">SomaticVariantcalling.sitesForContamination</a></dt>
<dd>
    <i>File? </i><br />
    A bed file, vcf file or interval list with regions for GetPileupSummaries to operate on.
</dd>
<dt id="SomaticVariantcalling.sitesForContaminationIndex"><a href="#SomaticVariantcalling.sitesForContaminationIndex">SomaticVariantcalling.sitesForContaminationIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the vcf file provided to sitesForContamination.
</dd>
<dt id="SomaticVariantcalling.snvIndex.memory"><a href="#SomaticVariantcalling.snvIndex.memory">SomaticVariantcalling.snvIndex.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.snvIndex.timeMinutes"><a href="#SomaticVariantcalling.snvIndex.timeMinutes">SomaticVariantcalling.snvIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldIndels.memory"><a href="#SomaticVariantcalling.strelka.addGTFieldIndels.memory">SomaticVariantcalling.strelka.addGTFieldIndels.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldIndels.outputVCFName"><a href="#SomaticVariantcalling.strelka.addGTFieldIndels.outputVCFName">SomaticVariantcalling.strelka.addGTFieldIndels.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldIndels.timeMinutes"><a href="#SomaticVariantcalling.strelka.addGTFieldIndels.timeMinutes">SomaticVariantcalling.strelka.addGTFieldIndels.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldSVs.memory"><a href="#SomaticVariantcalling.strelka.addGTFieldSVs.memory">SomaticVariantcalling.strelka.addGTFieldSVs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldSVs.outputVCFName"><a href="#SomaticVariantcalling.strelka.addGTFieldSVs.outputVCFName">SomaticVariantcalling.strelka.addGTFieldSVs.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldSVs.timeMinutes"><a href="#SomaticVariantcalling.strelka.addGTFieldSVs.timeMinutes">SomaticVariantcalling.strelka.addGTFieldSVs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldVariants.memory"><a href="#SomaticVariantcalling.strelka.addGTFieldVariants.memory">SomaticVariantcalling.strelka.addGTFieldVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldVariants.outputVCFName"><a href="#SomaticVariantcalling.strelka.addGTFieldVariants.outputVCFName">SomaticVariantcalling.strelka.addGTFieldVariants.outputVCFName</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>basename(strelkaVCF,".gz")</code><br />
    The location the output VCF file should be written to.
</dd>
<dt id="SomaticVariantcalling.strelka.addGTFieldVariants.timeMinutes"><a href="#SomaticVariantcalling.strelka.addGTFieldVariants.timeMinutes">SomaticVariantcalling.strelka.addGTFieldVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>20</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.bedPrepare.memory"><a href="#SomaticVariantcalling.strelka.bedPrepare.memory">SomaticVariantcalling.strelka.bedPrepare.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.bedPrepare.timeMinutes"><a href="#SomaticVariantcalling.strelka.bedPrepare.timeMinutes">SomaticVariantcalling.strelka.bedPrepare.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.dockerImage"><a href="#SomaticVariantcalling.strelka.combineVariants.dockerImage">SomaticVariantcalling.strelka.combineVariants.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"broadinstitute/gatk3:3.8-1"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.filteredRecordsMergeType"><a href="#SomaticVariantcalling.strelka.combineVariants.filteredRecordsMergeType">SomaticVariantcalling.strelka.combineVariants.filteredRecordsMergeType</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"KEEP_IF_ANY_UNFILTERED"</code><br />
    Equivalent to CombineVariants' `--filteredrecordsmergetype` option.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.genotypeMergeOption"><a href="#SomaticVariantcalling.strelka.combineVariants.genotypeMergeOption">SomaticVariantcalling.strelka.combineVariants.genotypeMergeOption</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"UNIQUIFY"</code><br />
    Equivalent to CombineVariants' `--genotypemergeoption` option.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.javaXmx"><a href="#SomaticVariantcalling.strelka.combineVariants.javaXmx">SomaticVariantcalling.strelka.combineVariants.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.memory"><a href="#SomaticVariantcalling.strelka.combineVariants.memory">SomaticVariantcalling.strelka.combineVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.combineVariants.timeMinutes"><a href="#SomaticVariantcalling.strelka.combineVariants.timeMinutes">SomaticVariantcalling.strelka.combineVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>180</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.compressionLevel"><a href="#SomaticVariantcalling.strelka.gatherIndels.compressionLevel">SomaticVariantcalling.strelka.gatherIndels.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.javaXmx"><a href="#SomaticVariantcalling.strelka.gatherIndels.javaXmx">SomaticVariantcalling.strelka.gatherIndels.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.memory"><a href="#SomaticVariantcalling.strelka.gatherIndels.memory">SomaticVariantcalling.strelka.gatherIndels.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.timeMinutes"><a href="#SomaticVariantcalling.strelka.gatherIndels.timeMinutes">SomaticVariantcalling.strelka.gatherIndels.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.useJdkDeflater"><a href="#SomaticVariantcalling.strelka.gatherIndels.useJdkDeflater">SomaticVariantcalling.strelka.gatherIndels.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherIndels.useJdkInflater"><a href="#SomaticVariantcalling.strelka.gatherIndels.useJdkInflater">SomaticVariantcalling.strelka.gatherIndels.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.compressionLevel"><a href="#SomaticVariantcalling.strelka.gatherSVs.compressionLevel">SomaticVariantcalling.strelka.gatherSVs.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.javaXmx"><a href="#SomaticVariantcalling.strelka.gatherSVs.javaXmx">SomaticVariantcalling.strelka.gatherSVs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.memory"><a href="#SomaticVariantcalling.strelka.gatherSVs.memory">SomaticVariantcalling.strelka.gatherSVs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.timeMinutes"><a href="#SomaticVariantcalling.strelka.gatherSVs.timeMinutes">SomaticVariantcalling.strelka.gatherSVs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.useJdkDeflater"><a href="#SomaticVariantcalling.strelka.gatherSVs.useJdkDeflater">SomaticVariantcalling.strelka.gatherSVs.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherSVs.useJdkInflater"><a href="#SomaticVariantcalling.strelka.gatherSVs.useJdkInflater">SomaticVariantcalling.strelka.gatherSVs.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.compressionLevel"><a href="#SomaticVariantcalling.strelka.gatherVariants.compressionLevel">SomaticVariantcalling.strelka.gatherVariants.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.javaXmx"><a href="#SomaticVariantcalling.strelka.gatherVariants.javaXmx">SomaticVariantcalling.strelka.gatherVariants.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.memory"><a href="#SomaticVariantcalling.strelka.gatherVariants.memory">SomaticVariantcalling.strelka.gatherVariants.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.timeMinutes"><a href="#SomaticVariantcalling.strelka.gatherVariants.timeMinutes">SomaticVariantcalling.strelka.gatherVariants.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.useJdkDeflater"><a href="#SomaticVariantcalling.strelka.gatherVariants.useJdkDeflater">SomaticVariantcalling.strelka.gatherVariants.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="SomaticVariantcalling.strelka.gatherVariants.useJdkInflater"><a href="#SomaticVariantcalling.strelka.gatherVariants.useJdkInflater">SomaticVariantcalling.strelka.gatherVariants.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="SomaticVariantcalling.strelka.indelsIndex.memory"><a href="#SomaticVariantcalling.strelka.indelsIndex.memory">SomaticVariantcalling.strelka.indelsIndex.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.indelsIndex.timeMinutes"><a href="#SomaticVariantcalling.strelka.indelsIndex.timeMinutes">SomaticVariantcalling.strelka.indelsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.mantaSomatic.cores"><a href="#SomaticVariantcalling.strelka.mantaSomatic.cores">SomaticVariantcalling.strelka.mantaSomatic.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SomaticVariantcalling.strelka.mantaSomatic.memoryGb"><a href="#SomaticVariantcalling.strelka.mantaSomatic.memoryGb">SomaticVariantcalling.strelka.mantaSomatic.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="SomaticVariantcalling.strelka.mantaSomatic.timeMinutes"><a href="#SomaticVariantcalling.strelka.mantaSomatic.timeMinutes">SomaticVariantcalling.strelka.mantaSomatic.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.scatterList.memory"><a href="#SomaticVariantcalling.strelka.scatterList.memory">SomaticVariantcalling.strelka.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.scatterList.prefix"><a href="#SomaticVariantcalling.strelka.scatterList.prefix">SomaticVariantcalling.strelka.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"scatters/scatter-"</code><br />
    The prefix of the ouput files. Output will be named like: <PREFIX><N>.bed, in which N is an incrementing number. Default 'scatter-'.
</dd>
<dt id="SomaticVariantcalling.strelka.scatterList.timeMinutes"><a href="#SomaticVariantcalling.strelka.scatterList.timeMinutes">SomaticVariantcalling.strelka.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.scatterSize"><a href="#SomaticVariantcalling.strelka.scatterSize">SomaticVariantcalling.strelka.scatterSize</a></dt>
<dd>
    <i>Int? </i><br />
    The size of the scattered regions in bases. Scattering is used to speed up certain processes. The genome will be seperated into multiple chunks (scatters) which will be processed in their own job, allowing for parallel processing. Higher values will result in a lower number of jobs. The optimal value here will depend on the available resources.
</dd>
<dt id="SomaticVariantcalling.strelka.scatterSizeMillions"><a href="#SomaticVariantcalling.strelka.scatterSizeMillions">SomaticVariantcalling.strelka.scatterSizeMillions</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1000</code><br />
    Same as scatterSize, but is multiplied by 1000000 to get scatterSize. This allows for setting larger values more easily
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaGermline.cores"><a href="#SomaticVariantcalling.strelka.strelkaGermline.cores">SomaticVariantcalling.strelka.strelkaGermline.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaGermline.memoryGb"><a href="#SomaticVariantcalling.strelka.strelkaGermline.memoryGb">SomaticVariantcalling.strelka.strelkaGermline.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaGermline.timeMinutes"><a href="#SomaticVariantcalling.strelka.strelkaGermline.timeMinutes">SomaticVariantcalling.strelka.strelkaGermline.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>90</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaSomatic.cores"><a href="#SomaticVariantcalling.strelka.strelkaSomatic.cores">SomaticVariantcalling.strelka.strelkaSomatic.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaSomatic.memoryGb"><a href="#SomaticVariantcalling.strelka.strelkaSomatic.memoryGb">SomaticVariantcalling.strelka.strelkaSomatic.memoryGb</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    The amount of memory this job will use in Gigabytes.
</dd>
<dt id="SomaticVariantcalling.strelka.strelkaSomatic.timeMinutes"><a href="#SomaticVariantcalling.strelka.strelkaSomatic.timeMinutes">SomaticVariantcalling.strelka.strelkaSomatic.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>90</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.svsIndex.memory"><a href="#SomaticVariantcalling.strelka.svsIndex.memory">SomaticVariantcalling.strelka.svsIndex.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.svsIndex.timeMinutes"><a href="#SomaticVariantcalling.strelka.svsIndex.timeMinutes">SomaticVariantcalling.strelka.svsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.strelka.variantsIndex.memory"><a href="#SomaticVariantcalling.strelka.variantsIndex.memory">SomaticVariantcalling.strelka.variantsIndex.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"2G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.strelka.variantsIndex.timeMinutes"><a href="#SomaticVariantcalling.strelka.variantsIndex.timeMinutes">SomaticVariantcalling.strelka.variantsIndex.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputFile,"G"))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.trainingSet"><a href="#SomaticVariantcalling.trainingSet">SomaticVariantcalling.trainingSet</a></dt>
<dd>
    <i>struct(jsmVCF : File?, lofreqIndel : File?, lofreqSNV : File?, museVCF : File?, mutect2VCF : File?, normalBam : File?, normalBamIndex : File?, scalpelVCF : File?, somaticsniperVCF : File?, strelkaIndel : File?, strelkaSNV : File?, truthIndel : File, truthSNV : File, tumorBam : File, tumorBamIndex : File, vardictVCF : File?, varscanIndel : File?, varscanSNV : File?)? </i><br />
    VCF files used to train somaticseq.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryAlignments"><a href="#SomaticVariantcalling.vardict.filterSupplementaryAlignments">SomaticVariantcalling.vardict.filterSupplementaryAlignments</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not supplementary reads should be filtered before vardict is run.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.excludeSpecificFilter"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.excludeSpecificFilter">SomaticVariantcalling.vardict.filterSupplementaryControl.excludeSpecificFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-G` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.includeFilter"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.includeFilter">SomaticVariantcalling.vardict.filterSupplementaryControl.includeFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-f` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.MAPQthreshold"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.MAPQthreshold">SomaticVariantcalling.vardict.filterSupplementaryControl.MAPQthreshold</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-q` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.memory"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.memory">SomaticVariantcalling.vardict.filterSupplementaryControl.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"1G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.referenceFasta"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.referenceFasta">SomaticVariantcalling.vardict.filterSupplementaryControl.referenceFasta</a></dt>
<dd>
    <i>File? </i><br />
    The reference fasta file also used for mapping.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.threads"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.threads">SomaticVariantcalling.vardict.filterSupplementaryControl.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.timeMinutes"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.timeMinutes">SomaticVariantcalling.vardict.filterSupplementaryControl.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(inFile,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryControl.uncompressedBamOutput"><a href="#SomaticVariantcalling.vardict.filterSupplementaryControl.uncompressedBamOutput">SomaticVariantcalling.vardict.filterSupplementaryControl.uncompressedBamOutput</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to samtools view's `-u` flag.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.excludeSpecificFilter"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.excludeSpecificFilter">SomaticVariantcalling.vardict.filterSupplementaryTumor.excludeSpecificFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-G` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.includeFilter"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.includeFilter">SomaticVariantcalling.vardict.filterSupplementaryTumor.includeFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-f` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.MAPQthreshold"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.MAPQthreshold">SomaticVariantcalling.vardict.filterSupplementaryTumor.MAPQthreshold</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-q` option.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.memory"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.memory">SomaticVariantcalling.vardict.filterSupplementaryTumor.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"1G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.referenceFasta"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.referenceFasta">SomaticVariantcalling.vardict.filterSupplementaryTumor.referenceFasta</a></dt>
<dd>
    <i>File? </i><br />
    The reference fasta file also used for mapping.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.threads"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.threads">SomaticVariantcalling.vardict.filterSupplementaryTumor.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.timeMinutes"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.timeMinutes">SomaticVariantcalling.vardict.filterSupplementaryTumor.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(inFile,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.vardict.filterSupplementaryTumor.uncompressedBamOutput"><a href="#SomaticVariantcalling.vardict.filterSupplementaryTumor.uncompressedBamOutput">SomaticVariantcalling.vardict.filterSupplementaryTumor.uncompressedBamOutput</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to samtools view's `-u` flag.
</dd>
<dt id="SomaticVariantcalling.vardict.gatherVcfs.javaXmx"><a href="#SomaticVariantcalling.vardict.gatherVcfs.javaXmx">SomaticVariantcalling.vardict.gatherVcfs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.vardict.gatherVcfs.memory"><a href="#SomaticVariantcalling.vardict.gatherVcfs.memory">SomaticVariantcalling.vardict.gatherVcfs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"9G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.vardict.gatherVcfs.timeMinutes"><a href="#SomaticVariantcalling.vardict.gatherVcfs.timeMinutes">SomaticVariantcalling.vardict.gatherVcfs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(vcfFiles,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.chunkSize"><a href="#SomaticVariantcalling.vardict.scatterList.chunkSize">SomaticVariantcalling.vardict.scatterList.chunkSize</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-c` option.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.memory"><a href="#SomaticVariantcalling.vardict.scatterList.memory">SomaticVariantcalling.vardict.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.minimumBasesPerFile"><a href="#SomaticVariantcalling.vardict.scatterList.minimumBasesPerFile">SomaticVariantcalling.vardict.scatterList.minimumBasesPerFile</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-m` option.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.overlap"><a href="#SomaticVariantcalling.vardict.scatterList.overlap">SomaticVariantcalling.vardict.scatterList.overlap</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-o` option.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.prefix"><a href="#SomaticVariantcalling.vardict.scatterList.prefix">SomaticVariantcalling.vardict.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"./scatter"</code><br />
    The prefix for the output files.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.splitContigs"><a href="#SomaticVariantcalling.vardict.scatterList.splitContigs">SomaticVariantcalling.vardict.scatterList.splitContigs</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    If set, contigs are allowed to be split up over multiple files.
</dd>
<dt id="SomaticVariantcalling.vardict.scatterList.timeMinutes"><a href="#SomaticVariantcalling.vardict.scatterList.timeMinutes">SomaticVariantcalling.vardict.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.chromosomeColumn"><a href="#SomaticVariantcalling.vardict.varDict.chromosomeColumn">SomaticVariantcalling.vardict.varDict.chromosomeColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    Equivalent to vardict-java's `-c` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.endColumn"><a href="#SomaticVariantcalling.vardict.varDict.endColumn">SomaticVariantcalling.vardict.varDict.endColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>3</code><br />
    Equivalent to vardict-java's `-E` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.geneColumn"><a href="#SomaticVariantcalling.vardict.varDict.geneColumn">SomaticVariantcalling.vardict.varDict.geneColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to vardict-java's `-g` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.javaXmx"><a href="#SomaticVariantcalling.vardict.varDict.javaXmx">SomaticVariantcalling.vardict.varDict.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"16G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.mappingQuality"><a href="#SomaticVariantcalling.vardict.varDict.mappingQuality">SomaticVariantcalling.vardict.varDict.mappingQuality</a></dt>
<dd>
    <i>Float </i><i>&mdash; Default:</i> <code>20</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-Q` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.memory"><a href="#SomaticVariantcalling.vardict.varDict.memory">SomaticVariantcalling.vardict.varDict.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"18G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.minimumAlleleFrequency"><a href="#SomaticVariantcalling.vardict.varDict.minimumAlleleFrequency">SomaticVariantcalling.vardict.varDict.minimumAlleleFrequency</a></dt>
<dd>
    <i>Float </i><i>&mdash; Default:</i> <code>0.02</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-f` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.minimumTotalDepth"><a href="#SomaticVariantcalling.vardict.varDict.minimumTotalDepth">SomaticVariantcalling.vardict.varDict.minimumTotalDepth</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>8</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-d` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.minimumVariantDepth"><a href="#SomaticVariantcalling.vardict.varDict.minimumVariantDepth">SomaticVariantcalling.vardict.varDict.minimumVariantDepth</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-v` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.outputAllVariantsAtSamePosition"><a href="#SomaticVariantcalling.vardict.varDict.outputAllVariantsAtSamePosition">SomaticVariantcalling.vardict.varDict.outputAllVariantsAtSamePosition</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-A` flag.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.outputCandidateSomaticOnly"><a href="#SomaticVariantcalling.vardict.varDict.outputCandidateSomaticOnly">SomaticVariantcalling.vardict.varDict.outputCandidateSomaticOnly</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-M` flag.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.startColumn"><a href="#SomaticVariantcalling.vardict.varDict.startColumn">SomaticVariantcalling.vardict.varDict.startColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    Equivalent to vardict-java's `-S` option.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.threads"><a href="#SomaticVariantcalling.vardict.varDict.threads">SomaticVariantcalling.vardict.varDict.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SomaticVariantcalling.vardict.varDict.timeMinutes"><a href="#SomaticVariantcalling.vardict.varDict.timeMinutes">SomaticVariantcalling.vardict.varDict.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>300</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="SomaticVariantcalling.variantsForContamination"><a href="#SomaticVariantcalling.variantsForContamination">SomaticVariantcalling.variantsForContamination</a></dt>
<dd>
    <i>File? </i><br />
    A VCF file with common variants.
</dd>
<dt id="SomaticVariantcalling.variantsForContaminationIndex"><a href="#SomaticVariantcalling.variantsForContaminationIndex">SomaticVariantcalling.variantsForContaminationIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index of the common variants VCF file.
</dd>
</dl>
</details>





## Do not set these inputs!
The following inputs should ***not*** be set, even though womtool may
show them as being available inputs.

* SomaticVariantcalling.DONOTDEFINETHIS
* SomaticVariantcalling.indelIndex.type
* SomaticVariantcalling.snvIndex.type
* SomaticVariantcalling.strelka.indelsIndex.type
* SomaticVariantcalling.strelka.svsIndex.type
* SomaticVariantcalling.strelka.variantsIndex.type
* SomaticVariantcalling.strelka.strelkaSomatic.doNotDefineThis
