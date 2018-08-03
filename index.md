---
layout: default
title: Home
version: develop
latest: true
---

This repository contains a collection of [BioWDL](https://github.com/biowdl)
workflows which can be used for somatic variantcalling. There are currently
four workflows available:
- mutect2.wdl: Uses MuTect2
- strelka.wdl: Uses Strelka
- vardict.wdl: Uses VarDict
- somatic-variantcalling.wdl: Perform all three other workflows.

These workflows do not perform any kind of preprocessing.

## Usage

### `mutect2.wdl`
`mutect2.wdl` can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```
java -jar cromwell-<version>.jar run -i inputs.json mutect2.wdl.wdl
```

The inputs JSON can be generated using WOMtools as described in the [WOMtools
documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).

The primary inputs are described below, additional inputs (such as precommands)
are available. Please use the above mentioned WOMtools command to see all
available inputs.

| field | type | default | |
|-|-|-|-|
| refDict | `File` | | The reference dict file. |
| refFasta | `File` | | The reference fasta file. |
| refFastaIndex | `File` | | The index for the reference fasta file. |
| tumorBam | `File` | | The BAM file containing the aligned sequencing data for the tumor sample. |
| tumorIndex | `File` | | The index for the tumor BAM file. |
| tumorSample | `String` | | The name/identifier of the tumor sample. |
| vcfPath | `String` | | The output VCF file. |
| controlBam | `File?` | | The BAM file containing the aligned sequencing data for the control/normal sample. |
| controlIndex | `File?` | | The index for the control BAM file. |
| controlSample | `String?` | | The name/identifier for the control sample. |

>All inputs have to be preceded by `Mutect2.`.
Type is indicated according to the WDL data types: `File` should be indicators
of file location (a string in JSON). Types ending in `?` indicate the input is
optional, types ending in `+` indicate they require at least one element.

### `strelka.wdl`
`strelka.wdl` can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```
java -jar cromwell-<version>.jar run -i inputs.json strelka.wdl
```

The inputs JSON can be generated using WOMtools as described in the [WOMtools
documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).

The primary inputs are described below, additional inputs (such as precommands)
are available. Please use the above mentioned WOMtools command to see all
available inputs.

| field | type | default | |
|-|-|-|-|
| refDict | `File` | | The reference dict file. |
| refFasta | `File` | | The reference fasta file. |
| refFastaIndex | `File` | | The index for the reference fasta file. |
| tumorBam | `File` | | The BAM file containing the aligned sequencing data for the tumor sample. |
| tumorIndex | `File` | | The index for the tumor BAM file. |
| vcfPath | `String` | | The output VCF file. |
| strelkaGermline.exome | `Boolean` | `false` | Whether or not the data is exome (or targeted) sequecing data. Only used if no control BAM is given. |
| strelkaGermline.rna | `Boolean` | `false` | Whether or not the data is RNAseq data. Only used if no control BAM is given. |
| strelkaSomatic.exome | `Boolean` | `false` | Whether or not the data is exome (or targeted) sequecing data. Only used if a control BAM is given. |
| controlBam | `File?` | | The BAM file containing the aligned sequencing data for the control/normal sample. If this is not given Strelka's germline analysis is used. |
| controlIndex | `File?` | | The index for the control BAM file. |

>All inputs have to be preceded by with `Strelka.`.
Type is indicated according to the WDL data types: `File` should be indicators
of file location (a string in JSON). Types ending in `?` indicate the input is
optional, types ending in `+` indicate they require at least one element.

### `vardict.wdl`
`vardict.wdl` can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```
java -jar cromwell-<version>.jar run -i inputs.json vardict.wdl
```

The inputs JSON can be generated using WOMtools as described in the [WOMtools
documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).

The primary inputs are described below, additional inputs (such as precommands)
are available. Please use the above mentioned WOMtools command to see all
available inputs.

| field | type | default | |
|-|-|-|-|
| refDict | `File` | | The reference dict file. |
| refFasta | `File` | | The reference fasta file. |
| refFastaIndex | `File` | | The index for the reference fasta file. |
| tumorBam | `File` | | The BAM file containing the aligned sequencing data for the tumor sample. |
| tumorIndex | `File` | | The index for the tumor BAM file. |
| tumorSample | `String` | | The name/identifier of the tumor sample. |
| vcfPath | `String` | | The output VCF file. |
| controlBam | `File?` | | The BAM file containing the aligned sequencing data for the control/normal sample. |
| controlIndex | `File?` | | The index for the control BAM file. |
| controlSample | `String?` | | The name/identifier for the control sample. |

>All inputs have to be preceded by with `VarDict.`.
Type is indicated according to the WDL data types: `File` should be indicators
of file location (a string in JSON). Types ending in `?` indicate the input is
optional, types ending in `+` indicate they require at least one element.

### `somatic-variantcalling.wdl`
`somatic-variantcalling.wdl` can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```
java -jar cromwell-<version>.jar run -i inputs.json somatic-variantcalling.wdl
```

The inputs JSON can be generated using WOMtools as described in the [WOMtools
documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).

The primary inputs are described below, additional inputs (such as precommands)
are available. Please use the above mentioned WOMtools command to see all
available inputs.

| field | type | default | |
|-|-|-|-|
| outputDir | `String` | | The outpur directory. |
| refDict | `File` | | The reference dict file. |
| refFasta | `File` | | The reference fasta file. |
| refFastaIndex | `File` | | The index for the reference fasta file. |
| tumorBam | `File` | | The BAM file containing the aligned sequencing data for the tumor sample. |
| tumorIndex | `File` | | The index for the tumor BAM file. |
| tumorSample | `String` | | The name/identifier of the tumor sample. |
| strelka.Strelka.<br />strelkaGermline.exome | `Boolean` | `false` | Whether or not the data is exome (or targeted) sequecing data. Only used if no control BAM is given. |
| strelka.Strelka.<br />strelkaGermline.rna | `Boolean` | `false` | Whether or not the data is RNAseq data. Only used if no control BAM is given. |
| strelka.Strelka.<br />strelkaSomatic.exome | `Boolean` | `false` | Whether or not the data is exome (or targeted) sequecing data. Only used if a control BAM is given. |
| controlBam | `File?` | | The BAM file containing the aligned sequencing data for the control/normal sample. If this is not given Strelka's germline analysis is used. |
| controlIndex | `File?` | | The index for the control BAM file. |
| controlSample | `String?` | | The name/identifier for the control sample. |

>All inputs have to be preceded by `SomaticVariantcalling.`.
Type is indicated according to the WDL data types: `File` should be indicators
of file location (a string in JSON). Types ending in `?` indicate the input is
optional, types ending in `+` indicate they require at least one element.

## Tool versions
Included in the repository is an `environment.yml` file. This file includes
all the tool version on which the workflow was tested. You can use conda and
this file to create an environment with all the correct tools.

## Output
### `mutect2.wdl`
A VCF file and its index.

### `strelka.wdl`
A VCF file and its index.

### `vardict.wdl`
A VCF file and its index.

### `somatic-variantcalling.wdl`
A Directory per used caller (MuTect2, Strelka and VarDict), each containing
the VCF (and its index) with the results from that caller.

## About
These workflows are part of [BioWDL](https://biowdl.github.io/)
developed by [the SASC team](http://sasc.lumc.nl/).

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any question related to these workflows, please use the
<a href='https://github.com/biowdl/somatic-variantcalling/issues'>github issue tracker</a>
or contact
 <a href='http://sasc.lumc.nl/'>the SASC team</a> directly at: <a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
