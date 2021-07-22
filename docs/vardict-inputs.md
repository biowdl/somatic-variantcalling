---
layout: default
title: "Inputs: VarDict"
---

# Inputs for VarDict

The following is an overview of all available inputs in
VarDict.


## Required inputs
<dl>
<dt id="VarDict.referenceFasta"><a href="#VarDict.referenceFasta">VarDict.referenceFasta</a></dt>
<dd>
    <i>File </i><br />
    The reference fasta file.
</dd>
<dt id="VarDict.referenceFastaDict"><a href="#VarDict.referenceFastaDict">VarDict.referenceFastaDict</a></dt>
<dd>
    <i>File </i><br />
    Sequence dictionary (.dict) file of the reference.
</dd>
<dt id="VarDict.referenceFastaFai"><a href="#VarDict.referenceFastaFai">VarDict.referenceFastaFai</a></dt>
<dd>
    <i>File </i><br />
    Fasta index (.fai) file of the reference.
</dd>
<dt id="VarDict.tumorBam"><a href="#VarDict.tumorBam">VarDict.tumorBam</a></dt>
<dd>
    <i>File </i><br />
    The BAM file for the tumor/case sample.
</dd>
<dt id="VarDict.tumorBamIndex"><a href="#VarDict.tumorBamIndex">VarDict.tumorBamIndex</a></dt>
<dd>
    <i>File </i><br />
    The index for the tumor/case sample's BAM file.
</dd>
<dt id="VarDict.tumorSample"><a href="#VarDict.tumorSample">VarDict.tumorSample</a></dt>
<dd>
    <i>String </i><br />
    The name of the tumor/case sample.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="VarDict.controlBam"><a href="#VarDict.controlBam">VarDict.controlBam</a></dt>
<dd>
    <i>File? </i><br />
    The BAM file for the normal/control sample.
</dd>
<dt id="VarDict.controlBamIndex"><a href="#VarDict.controlBamIndex">VarDict.controlBamIndex</a></dt>
<dd>
    <i>File? </i><br />
    The index for the normal/control sample's BAM file.
</dd>
<dt id="VarDict.controlSample"><a href="#VarDict.controlSample">VarDict.controlSample</a></dt>
<dd>
    <i>String? </i><br />
    The name of the normal/control sample.
</dd>
<dt id="VarDict.outputDir"><a href="#VarDict.outputDir">VarDict.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory to which the outputs will be written.
</dd>
<dt id="VarDict.regions"><a href="#VarDict.regions">VarDict.regions</a></dt>
<dd>
    <i>File? </i><br />
    A bed file describing the regions to operate on.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="VarDict.dockerImages"><a href="#VarDict.dockerImages">VarDict.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"picard": "quay.io/biocontainers/picard:2.23.2--0", "vardict-java": "quay.io/biocontainers/vardict-java:1.5.8--1", "samtools": "quay.io/biocontainers/samtools:1.10--h9402c20_2", "chunked-scatter": "quay.io/biocontainers/chunked-scatter:0.2.0--py_0"}</code><br />
    The docker images used. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="VarDict.filterSupplementaryAlignments"><a href="#VarDict.filterSupplementaryAlignments">VarDict.filterSupplementaryAlignments</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not supplementary reads should be filtered before vardict is run.
</dd>
<dt id="VarDict.filterSupplementaryControl.excludeSpecificFilter"><a href="#VarDict.filterSupplementaryControl.excludeSpecificFilter">VarDict.filterSupplementaryControl.excludeSpecificFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-G` option.
</dd>
<dt id="VarDict.filterSupplementaryControl.includeFilter"><a href="#VarDict.filterSupplementaryControl.includeFilter">VarDict.filterSupplementaryControl.includeFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-f` option.
</dd>
<dt id="VarDict.filterSupplementaryControl.MAPQthreshold"><a href="#VarDict.filterSupplementaryControl.MAPQthreshold">VarDict.filterSupplementaryControl.MAPQthreshold</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-q` option.
</dd>
<dt id="VarDict.filterSupplementaryControl.memory"><a href="#VarDict.filterSupplementaryControl.memory">VarDict.filterSupplementaryControl.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"1G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="VarDict.filterSupplementaryControl.referenceFasta"><a href="#VarDict.filterSupplementaryControl.referenceFasta">VarDict.filterSupplementaryControl.referenceFasta</a></dt>
<dd>
    <i>File? </i><br />
    The reference fasta file also used for mapping.
</dd>
<dt id="VarDict.filterSupplementaryControl.threads"><a href="#VarDict.filterSupplementaryControl.threads">VarDict.filterSupplementaryControl.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="VarDict.filterSupplementaryControl.timeMinutes"><a href="#VarDict.filterSupplementaryControl.timeMinutes">VarDict.filterSupplementaryControl.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(inFile,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="VarDict.filterSupplementaryControl.uncompressedBamOutput"><a href="#VarDict.filterSupplementaryControl.uncompressedBamOutput">VarDict.filterSupplementaryControl.uncompressedBamOutput</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to samtools view's `-u` flag.
</dd>
<dt id="VarDict.filterSupplementaryTumor.excludeSpecificFilter"><a href="#VarDict.filterSupplementaryTumor.excludeSpecificFilter">VarDict.filterSupplementaryTumor.excludeSpecificFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-G` option.
</dd>
<dt id="VarDict.filterSupplementaryTumor.includeFilter"><a href="#VarDict.filterSupplementaryTumor.includeFilter">VarDict.filterSupplementaryTumor.includeFilter</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-f` option.
</dd>
<dt id="VarDict.filterSupplementaryTumor.MAPQthreshold"><a href="#VarDict.filterSupplementaryTumor.MAPQthreshold">VarDict.filterSupplementaryTumor.MAPQthreshold</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to samtools view's `-q` option.
</dd>
<dt id="VarDict.filterSupplementaryTumor.memory"><a href="#VarDict.filterSupplementaryTumor.memory">VarDict.filterSupplementaryTumor.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"1G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="VarDict.filterSupplementaryTumor.referenceFasta"><a href="#VarDict.filterSupplementaryTumor.referenceFasta">VarDict.filterSupplementaryTumor.referenceFasta</a></dt>
<dd>
    <i>File? </i><br />
    The reference fasta file also used for mapping.
</dd>
<dt id="VarDict.filterSupplementaryTumor.threads"><a href="#VarDict.filterSupplementaryTumor.threads">VarDict.filterSupplementaryTumor.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="VarDict.filterSupplementaryTumor.timeMinutes"><a href="#VarDict.filterSupplementaryTumor.timeMinutes">VarDict.filterSupplementaryTumor.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(inFile,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="VarDict.filterSupplementaryTumor.uncompressedBamOutput"><a href="#VarDict.filterSupplementaryTumor.uncompressedBamOutput">VarDict.filterSupplementaryTumor.uncompressedBamOutput</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to samtools view's `-u` flag.
</dd>
<dt id="VarDict.gatherVcfs.javaXmx"><a href="#VarDict.gatherVcfs.javaXmx">VarDict.gatherVcfs.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="VarDict.gatherVcfs.memory"><a href="#VarDict.gatherVcfs.memory">VarDict.gatherVcfs.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"9G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="VarDict.gatherVcfs.timeMinutes"><a href="#VarDict.gatherVcfs.timeMinutes">VarDict.gatherVcfs.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1 + ceil((size(vcfFiles,"G") * 5))</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="VarDict.scatterList.chunkSize"><a href="#VarDict.scatterList.chunkSize">VarDict.scatterList.chunkSize</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-c` option.
</dd>
<dt id="VarDict.scatterList.memory"><a href="#VarDict.scatterList.memory">VarDict.scatterList.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"256M"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="VarDict.scatterList.minimumBasesPerFile"><a href="#VarDict.scatterList.minimumBasesPerFile">VarDict.scatterList.minimumBasesPerFile</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-m` option.
</dd>
<dt id="VarDict.scatterList.overlap"><a href="#VarDict.scatterList.overlap">VarDict.scatterList.overlap</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to chunked-scatter's `-o` option.
</dd>
<dt id="VarDict.scatterList.prefix"><a href="#VarDict.scatterList.prefix">VarDict.scatterList.prefix</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"./scatter"</code><br />
    The prefix for the output files.
</dd>
<dt id="VarDict.scatterList.splitContigs"><a href="#VarDict.scatterList.splitContigs">VarDict.scatterList.splitContigs</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    If set, contigs are allowed to be split up over multiple files.
</dd>
<dt id="VarDict.scatterList.timeMinutes"><a href="#VarDict.scatterList.timeMinutes">VarDict.scatterList.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
<dt id="VarDict.varDict.chromosomeColumn"><a href="#VarDict.varDict.chromosomeColumn">VarDict.varDict.chromosomeColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    Equivalent to vardict-java's `-c` option.
</dd>
<dt id="VarDict.varDict.endColumn"><a href="#VarDict.varDict.endColumn">VarDict.varDict.endColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>3</code><br />
    Equivalent to vardict-java's `-E` option.
</dd>
<dt id="VarDict.varDict.geneColumn"><a href="#VarDict.varDict.geneColumn">VarDict.varDict.geneColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to vardict-java's `-g` option.
</dd>
<dt id="VarDict.varDict.javaXmx"><a href="#VarDict.varDict.javaXmx">VarDict.varDict.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"16G"</code><br />
    The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="VarDict.varDict.mappingQuality"><a href="#VarDict.varDict.mappingQuality">VarDict.varDict.mappingQuality</a></dt>
<dd>
    <i>Float </i><i>&mdash; Default:</i> <code>20</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-Q` option.
</dd>
<dt id="VarDict.varDict.memory"><a href="#VarDict.varDict.memory">VarDict.varDict.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"18G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="VarDict.varDict.minimumAlleleFrequency"><a href="#VarDict.varDict.minimumAlleleFrequency">VarDict.varDict.minimumAlleleFrequency</a></dt>
<dd>
    <i>Float </i><i>&mdash; Default:</i> <code>0.02</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-f` option.
</dd>
<dt id="VarDict.varDict.minimumTotalDepth"><a href="#VarDict.varDict.minimumTotalDepth">VarDict.varDict.minimumTotalDepth</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>8</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-d` option.
</dd>
<dt id="VarDict.varDict.minimumVariantDepth"><a href="#VarDict.varDict.minimumVariantDepth">VarDict.varDict.minimumVariantDepth</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>4</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-v` option.
</dd>
<dt id="VarDict.varDict.outputAllVariantsAtSamePosition"><a href="#VarDict.varDict.outputAllVariantsAtSamePosition">VarDict.varDict.outputAllVariantsAtSamePosition</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-A` flag.
</dd>
<dt id="VarDict.varDict.outputCandidateSomaticOnly"><a href="#VarDict.varDict.outputCandidateSomaticOnly">VarDict.varDict.outputCandidateSomaticOnly</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to var2vcf_paired.pl or var2vcf_valid.pl's `-M` flag.
</dd>
<dt id="VarDict.varDict.startColumn"><a href="#VarDict.varDict.startColumn">VarDict.varDict.startColumn</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>2</code><br />
    Equivalent to vardict-java's `-S` option.
</dd>
<dt id="VarDict.varDict.threads"><a href="#VarDict.varDict.threads">VarDict.varDict.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="VarDict.varDict.timeMinutes"><a href="#VarDict.varDict.timeMinutes">VarDict.varDict.timeMinutes</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>300</code><br />
    The maximum amount of time the job will run in minutes.
</dd>
</dl>
</details>




