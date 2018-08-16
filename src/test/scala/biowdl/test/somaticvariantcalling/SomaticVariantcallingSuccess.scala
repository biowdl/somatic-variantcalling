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

import nl.biopet.utils.biowdl.PipelineSuccess
import nl.biopet.utils.ngs.vcf.getVcfIndexFile

trait SomaticVariantcallingSuccess
    extends SomaticVariantcalling
    with PipelineSuccess {

  // Mutect2
  val mutect2Vcf: File = controlBam match {
    case Some(_) =>
      new File(
        s"${outputDir.getAbsolutePath}/mutect2/$tumorSample-${controlSample
          .getOrElse(throw new IllegalStateException())}.vcf.gz")
    case _ =>
      new File(s"${outputDir.getAbsolutePath}/mutect2/$tumorSample.vcf.gz")
  }
  addMustHaveFile(mutect2Vcf)
  addMustHaveFile(getVcfIndexFile(mutect2Vcf))

  // Vardict
  val vardictVcf: File = controlBam match {
    case Some(_) =>
      new File(
        s"${outputDir.getAbsolutePath}/vardict/$tumorSample-${controlSample
          .getOrElse(throw new IllegalStateException())}.vcf.gz")
    case _ =>
      new File(s"${outputDir.getAbsolutePath}/vardict/$tumorSample.vcf.gz")
  }
  addMustHaveFile(vardictVcf)
  addMustHaveFile(getVcfIndexFile(vardictVcf))

  // Strelka
  val basename: String = controlBam match {
    case Some(_) =>
      s"$tumorSample-${controlSample.getOrElse(throw new IllegalStateException())}"
    case _ => s"$tumorSample"
  }
  def snvVCF: File = new File(outputDir, s"strelka/${basename}_variants.vcf.gz")
  def indelVCF: File = new File(outputDir, s"strelka/${basename}_indels.vcf.gz")
  def mantaVCF: File = new File(outputDir, s"strelka/${basename}_manta.vcf.gz")

  addMustHaveFile(snvVCF)
  addMustHaveFile(getVcfIndexFile(snvVCF))

  if (runManta) {
    addMustHaveFile(mantaVCF)
    addMustHaveFile(getVcfIndexFile(mantaVCF))
  } else {
    addMustNotHaveFile(mantaVCF)
    addMustNotHaveFile(getVcfIndexFile(mantaVCF))
  }

  if (controlBam.isDefined) {
    addMustHaveFile(indelVCF)
    addMustHaveFile(getVcfIndexFile(indelVCF))
  } else {
    addMustNotHaveFile(indelVCF)
    addMustNotHaveFile(getVcfIndexFile(indelVCF))
  }
}
