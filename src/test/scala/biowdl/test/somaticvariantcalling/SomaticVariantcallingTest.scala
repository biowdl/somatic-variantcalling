/*
 * Copyright (c) 2018 Biowdl
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package biowdl.test.somaticvariantcalling

import java.io.File

import nl.biopet.utils.biowdl.fixtureFile
import nl.biopet.utils.biowdl.references.TestReference

trait SomaticVariantcallingTest
    extends SomaticVariantcallingSuccess
    with TestReference {
  override def snvTruth: File =
    fixtureFile("samples", "wgs3", "wgs3_snv_subset.vcf.gz") // use a subset to ensure both TP and FP are present
  override def indelTruth: File =
    fixtureFile("samples", "wgs3", "wgs3_indel_subset.vcf.gz")
}

// no training, no manta, no control
class SomaticVariantcallingTestUnpairedConsensus
    extends SomaticVariantcallingTest {
  def tumorSample: String = "wgs3"
  def tumorBam: File = fixtureFile("samples", "wgs3", "wgs3.bam")
}

// no training, no manta, control
class SomaticVariantcallingTestPairedConsensus
    extends SomaticVariantcallingTestUnpairedConsensus {
  override def controlSample: Option[String] = Option("wgs1")
  override def controlBam: Option[File] =
    Option(fixtureFile("samples", "wgs1", "wgs1.bam"))
}

// training, manta, no control
class SomaticVariantcallingTestUnpairedTrainedWithManta
    extends SomaticVariantcallingTestUnpairedConsensus {
  override def runManta: Boolean = true
  override def trainingSet: Option[Map[String, Any]] =
    Option(
      Map(
        "truthIndel" -> indelTruth.getAbsolutePath,
        "truthSNV" -> snvTruth.getAbsolutePath,
        "tumorBam" -> Map(
          "file" -> tumorBam.getAbsolutePath,
          "index" -> getBamIndex(tumorBam).getAbsolutePath
        ),
        "mutect2VCF" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "single",
                                    "mutect2",
                                    "wgs3.vcf.gz"),
        "vardictVCF" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "single",
                                    "vardict",
                                    "wgs3.vcf.gz"),
        "strelkaSNV" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "single",
                                    "strelka",
                                    "wgs3_variants.vcf.gz")
      ))
}

// training, manta, control
class SomaticVariantcallingTestPairedTrainedWithManta
    extends SomaticVariantcallingTestPairedConsensus {
  override def runManta: Boolean = true
  override def trainingSet: Option[Map[String, Any]] =
    Option(
      Map(
        "truthIndel" -> indelTruth.getAbsolutePath,
        "truthSNV" -> snvTruth.getAbsolutePath,
        "tumorBam" -> Map(
          "file" -> tumorBam.getAbsolutePath,
          "index" -> getBamIndex(tumorBam).getAbsolutePath
        ),
        "normalBam" -> Map(
          "file" -> fixtureFile("samples", "wgs1", "wgs1.bam").getAbsolutePath,
          "index" -> getBamIndex(fixtureFile("samples", "wgs1", "wgs1.bam")).getAbsolutePath
        ),
        "mutect2VCF" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "paired",
                                    "mutect2",
                                    "wgs3-wgs1.vcf.gz"),
        "vardictVCF" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "paired",
                                    "vardict",
                                    "wgs3-wgs1.vcf.gz"),
        "strelkaSNV" -> fixtureFile("samples",
                                    "wgs3",
                                    "somatic_variantcalling_vcfs",
                                    "paired",
                                    "strelka",
                                    "wgs3-wgs1_variants.vcf.gz"),
        "strelkaIndel" -> fixtureFile("samples",
                                      "wgs3",
                                      "somatic_variantcalling_vcfs",
                                      "paired",
                                      "strelka",
                                      "wgs3-wgs1_indels.vcf.gz")
      ))
}
