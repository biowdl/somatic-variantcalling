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

package biowdl.test.mutect2

import java.io.File

import nl.biopet.utils.biowdl.PipelineSuccess
import nl.biopet.utils.ngs.intervals.BedRecord
import nl.biopet.utils.ngs.vcf.{getVcfIndexFile, loadRegion}
import org.testng.annotations.Test

trait Mutect2Success extends Mutect2 with PipelineSuccess {
  val outputVcf: File = new File(
    outputDir, {
      controlSample match {
        case Some(_) =>
          s"$tumorSample-${controlSample.getOrElse(new IllegalStateException())}.vcf.gz"
        case _ => s"$tumorSample.vcf.gz"
      }
    }
  )

  addMustHaveFile(outputVcf)
  addMustHaveFile(getVcfIndexFile(outputVcf))

  def truth: File

  def negativeTest: Boolean = false

  @Test
  def testVariantsExist()
    : Unit = { //Test if no records from truth are present in output
    val truthVariants = loadRegion(truth, BedRecord("chr1", 1, 16000))
    val outputVariants = loadRegion(outputVcf, BedRecord("chr1", 1, 16000))

    truthVariants.foreach(v => {
      val exists = outputVariants.exists(
        v2 =>
          v.getStart == v2.getStart & v.getEnd == v2.getEnd & v.getAlleles
            .equals(v2.getAlleles))
      if (negativeTest) assert(!exists)
      else assert(exists)
    })
  }
}
