Changelog
==========

<!--

Newest changes should be on top.

This document is user facing. Please word the changes in such a way
that users understand how the changes affect the new version.
-->

version 2.1.0-develop
---------------------
+ Default docker images have been updated to newer versions.
+ Replace biopet-scatterregions with scatter-regions tool from chunked-scatter.
+ Tasks were updated to contain the `time_minutes` runtime attribute and
  associated `timeMinutes` input, describing the maximum time the task will
  take to run.

version 2.0.0
-----------------
+ Move commonly used inputs to the top-level workflow inputs sections in order
  to work better with cromwell 48 and higher.
+ Add proper copyright headers to WDL files. So the free software license
  is clear to end users who wish to adapt and modify.
+ Added "rna" and "exome" inputs to strelka.
+ Added inputs oveviews to docs.
+ Added parameter_meta.
+ Added miniwdl to linting.

version 1.1.0
---------------------------
+ Added scattersize inputs to strelka and mutect2 workflows
+ Update tasks so they pass the correct memory requirements to the 
  execution engine. Memory requirements are set on a per-task (not
  per-core) basis.
+ Mutect2: Filtered output no longer overwrites unfiltered mutect2 output

version 1.0.0
---------------------------
+ Added documentation
+ General: Add calls to CombineVariants - merges Strelka's VCFs and VCFs for all callers.
+ Mutect2: Add variant filtering with the option to run the read orientation bias filter.
+ General/Mutect2: Update default GATK (4.1.2.0) and picard (2.19.0) versions used in the pipeline that concern Mutect2.
+ Vardict: Added an option to filter supplementary reads from input BAM files before calling vardict (see he `filterSupplementaryAlignments` input).
