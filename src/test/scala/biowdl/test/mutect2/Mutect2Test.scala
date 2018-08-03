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

import nl.biopet.utils.biowdl.fixtureFile
import nl.biopet.utils.biowdl.references.TestReference

class Mutect2TestUnpaired extends Mutect2Success with TestReference {
  def outputVcf: File = new File(outputDir, "test.vcf")
  def tumorSample: String = "wgs2"
  def tumorBam: File = fixtureFile("samples", "wgs2", "wgs2.bam")
}

class Mutect2TestPaired extends Mutect2TestUnpaired {
  override def controlSample: Option[String] = Option("wgs1")
  override def controlBam: Option[File] =
    Option(fixtureFile("samples", "wgs1", "wgs1.bam"))
}
