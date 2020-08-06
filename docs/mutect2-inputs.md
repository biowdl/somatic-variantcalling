---
layout: default
title: "Inputs: Mutect2"
---

# Inputs for Mutect2

The following is an overview of all available inputs in
Mutect2.


## Required inputs
<dl>
<dt id="Mutect2.referenceFasta"><a href="#Mutect2.referenceFasta">Mutect2.referenceFasta</a></dt>
<dd>
    <i>File </i><br />
    The reference fasta file.
</dd>
<dt id="Mutect2.referenceFastaDict"><a href="#Mutect2.referenceFastaDict">Mutect2.referenceFastaDict</a></dt>
<dd>
    <i>File </i><br />
    Sequence dictionary (.dict) file of the reference.
</dd>
<dt id="Mutect2.referenceFastaFai"><a href="#Mutect2.referenceFastaFai">Mutect2.referenceFastaFai</a></dt>
<dd>
    <i>File </i><br />
    Fasta index (.fai) file of the reference.
</dd>
<dt id="Mutect2.tumorBam"><a href="#Mutect2.tumorBam">Mutect2.tumorBam</a></dt>
<dd>
    <i>File </i><br />
    The BAM file for the tumor/case sample.
</dd>
<dt id="Mutect2.tumorBamIndex"><a href="#Mutect2.tumorBamIndex">Mutect2.tumorBamIndex</a></dt>
<dd>
    <i>File </i><br />
    The index for the tumor/case sample's BAM file.
</dd>
<dt id="Mutect2.tumorSample"><a href="#Mutect2.tumorSample">Mutect2.tumorSample</a></dt>
<dd>
    <i>String </i><br />
    The name of the tumor/case sample.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="Mutect2.controlBam"><a href="#Mutect2.controlBam">Mutect2.controlBam</a></dt>
<dd>
    <i>File? </i><br />
    The BAM file for the normal/control sample.
</dd>
<dt id="Mutect2.controlBamIndex"><a href="#Mutect2.controlBamIndex">Mutect2.controlBamIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the normal/control sample's BAM file.
</dd>
<dt id="Mutect2.controlSample"><a href="#Mutect2.controlSample">Mutect2.controlSample</a></dt>
<dd>
    <i>String? </i><br />
    The name of the normal/control sample.
</dd>
<dt id="Mutect2.outputDir"><a href="#Mutect2.outputDir">Mutect2.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory to which the outputs will be written.
</dd>
<dt id="Mutect2.regions"><a href="#Mutect2.regions">Mutect2.regions</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing the regions to operate on.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="Mutect2.calculateContamination.javaXmx"><a href="#Mutect2.calculateContamination.javaXmx">Mutect2.calculateContamination.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.calculateContamination.memory"><a href="#Mutect2.calculateContamination.memory">Mutect2.calculateContamination.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.calculateContamination.timeMinutes"><a href="#Mutect2.calculateContamination.timeMinutes">Mutect2.calculateContamination.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>180</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.dockerImages"><a href="#Mutect2.dockerImages">Mutect2.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"picard": "quay.io/biocontainers/picard:2.23.2--0", "gatk4": "quay.io/biocontainers/gatk4:4.1.8.0--py38h37ae868_0", "chunked-scatter": "quay.io/biocontainers/chunked-scatter:1.0.0--py_0"}</code><br />
    The docker images used. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="Mutect2.filterMutectCalls.javaXmx"><a href="#Mutect2.filterMutectCalls.javaXmx">Mutect2.filterMutectCalls.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.filterMutectCalls.memory"><a href="#Mutect2.filterMutectCalls.memory">Mutect2.filterMutectCalls.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.filterMutectCalls.timeMinutes"><a href="#Mutect2.filterMutectCalls.timeMinutes">Mutect2.filterMutectCalls.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>60</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.filterMutectCalls.uniqueAltReadCount"><a href="#Mutect2.filterMutectCalls.uniqueAltReadCount">Mutect2.filterMutectCalls.uniqueAltReadCount</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to FilterMutectCalls' `--unique-alt-read-count` option.
</dd>
<dt id="Mutect2.gatherVcfs.compressionLevel"><a href="#Mutect2.gatherVcfs.compressionLevel">Mutect2.gatherVcfs.compressionLevel</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The compression level at which the BAM files are written
</dd>
<dt id="Mutect2.gatherVcfs.javaXmx"><a href="#Mutect2.gatherVcfs.javaXmx">Mutect2.gatherVcfs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.gatherVcfs.memory"><a href="#Mutect2.gatherVcfs.memory">Mutect2.gatherVcfs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.gatherVcfs.timeMinutes"><a href="#Mutect2.gatherVcfs.timeMinutes">Mutect2.gatherVcfs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil(size(inputVCFs,"G")) * 2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.gatherVcfs.useJdkDeflater"><a href="#Mutect2.gatherVcfs.useJdkDeflater">Mutect2.gatherVcfs.useJdkDeflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java deflator to compress the BAM files. False uses the optimized intel deflater.
</dd>
<dt id="Mutect2.gatherVcfs.useJdkInflater"><a href="#Mutect2.gatherVcfs.useJdkInflater">Mutect2.gatherVcfs.useJdkInflater</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    True, uses the java inflater. False, uses the optimized intel inflater.
</dd>
<dt id="Mutect2.getPileupSummariesNormal.javaXmx"><a href="#Mutect2.getPileupSummariesNormal.javaXmx">Mutect2.getPileupSummariesNormal.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.getPileupSummariesNormal.memory"><a href="#Mutect2.getPileupSummariesNormal.memory">Mutect2.getPileupSummariesNormal.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.getPileupSummariesNormal.timeMinutes"><a href="#Mutect2.getPileupSummariesNormal.timeMinutes">Mutect2.getPileupSummariesNormal.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.getPileupSummariesTumor.javaXmx"><a href="#Mutect2.getPileupSummariesTumor.javaXmx">Mutect2.getPileupSummariesTumor.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.getPileupSummariesTumor.memory"><a href="#Mutect2.getPileupSummariesTumor.memory">Mutect2.getPileupSummariesTumor.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.getPileupSummariesTumor.timeMinutes"><a href="#Mutect2.getPileupSummariesTumor.timeMinutes">Mutect2.getPileupSummariesTumor.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.learnReadOrientationModel.javaXmx"><a href="#Mutect2.learnReadOrientationModel.javaXmx">Mutect2.learnReadOrientationModel.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.learnReadOrientationModel.memory"><a href="#Mutect2.learnReadOrientationModel.memory">Mutect2.learnReadOrientationModel.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"13G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.learnReadOrientationModel.timeMinutes"><a href="#Mutect2.learnReadOrientationModel.timeMinutes">Mutect2.learnReadOrientationModel.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>120</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.mergeStats.javaXmx"><a href="#Mutect2.mergeStats.javaXmx">Mutect2.mergeStats.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"14G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.mergeStats.memory"><a href="#Mutect2.mergeStats.memory">Mutect2.mergeStats.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"15G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.mergeStats.timeMinutes"><a href="#Mutect2.mergeStats.timeMinutes">Mutect2.mergeStats.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>30</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.mutect2.f1r2TarGz"><a href="#Mutect2.mutect2.f1r2TarGz">Mutect2.mutect2.f1r2TarGz</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"f1r2.tar.gz"</code><br />
    Equivalent to Mutect2's `--f1r2-tar-gz` option.
</dd>
<dt id="Mutect2.mutect2.germlineResource"><a href="#Mutect2.mutect2.germlineResource">Mutect2.mutect2.germlineResource</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to Mutect2's `--germline-resource` option.
</dd>
<dt id="Mutect2.mutect2.germlineResourceIndex"><a href="#Mutect2.mutect2.germlineResourceIndex">Mutect2.mutect2.germlineResourceIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the germline resource.
</dd>
<dt id="Mutect2.mutect2.javaXmx"><a href="#Mutect2.mutect2.javaXmx">Mutect2.mutect2.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="Mutect2.mutect2.memory"><a href="#Mutect2.mutect2.memory">Mutect2.mutect2.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"5G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.mutect2.outputStats"><a href="#Mutect2.mutect2.outputStats">Mutect2.mutect2.outputStats</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>outputVcf + ".stats"</code><br />
    The location the output statistics should be written to.
</dd>
<dt id="Mutect2.mutect2.panelOfNormals"><a href="#Mutect2.mutect2.panelOfNormals">Mutect2.mutect2.panelOfNormals</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to Mutect2's `--panel-of-normals` option.
</dd>
<dt id="Mutect2.mutect2.panelOfNormalsIndex"><a href="#Mutect2.mutect2.panelOfNormalsIndex">Mutect2.mutect2.panelOfNormalsIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the panel of normals.
</dd>
<dt id="Mutect2.mutect2.timeMinutes"><a href="#Mutect2.mutect2.timeMinutes">Mutect2.mutect2.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>240</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.scatterList.memory"><a href="#Mutect2.scatterList.memory">Mutect2.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="Mutect2.scatterList.prefix"><a href="#Mutect2.scatterList.prefix">Mutect2.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"scatters/scatter-"</code><br />
    The prefix of the ouput files. Output will be named like: <PREFIX><N>.bed, in which N is an incrementing number. Default 'scatter-'.
</dd>
<dt id="Mutect2.scatterList.timeMinutes"><a href="#Mutect2.scatterList.timeMinutes">Mutect2.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="Mutect2.scatterSize"><a href="#Mutect2.scatterSize">Mutect2.scatterSize</a></dt>
<dd>
    <i>Int? </i><br />
    The size of the scattered regions in bases. Scattering is used to speed up certain processes. The genome will be seperated into multiple chunks (scatters) which will be processed in their own job, allowing for parallel processing. Higher values will result in a lower number of jobs. The optimal value here will depend on the available resources.
</dd>
<dt id="Mutect2.scatterSizeMillions"><a href="#Mutect2.scatterSizeMillions">Mutect2.scatterSizeMillions</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1000</code><br />
    Same as scatterSize, but is multiplied by 1000000 to get scatterSize. This allows for setting larger values more easily
</dd>
<dt id="Mutect2.sitesForContamination"><a href="#Mutect2.sitesForContamination">Mutect2.sitesForContamination</a></dt>
<dd>
    <i>File? </i><br />
    A bed file, vcf file or interval list with regions for GetPileupSummaries to operate on.
</dd>
<dt id="Mutect2.sitesForContaminationIndex"><a href="#Mutect2.sitesForContaminationIndex">Mutect2.sitesForContaminationIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the vcf file provided to sitesForContamination.
</dd>
<dt id="Mutect2.variantsForContamination"><a href="#Mutect2.variantsForContamination">Mutect2.variantsForContamination</a></dt>
<dd>
    <i>File? </i><br />
    A VCF file with common variants.
</dd>
<dt id="Mutect2.variantsForContaminationIndex"><a href="#Mutect2.variantsForContaminationIndex">Mutect2.variantsForContaminationIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index of the common variants VCF file.
</dd>
</dl>
</details>




