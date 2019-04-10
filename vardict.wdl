version 1.0

import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/vardict.wdl" as vardict
import "tasks/common.wdl" as common

workflow VarDict{
    input {
        String tumorSample
        IndexedBamFile tumorBam
        String? controlSample
        IndexedBamFile? controlBam
        Reference reference
        String outputDir
        File? regions

        Map[String, String] dockerTags = {
            "picard":"2.18.26--0",
            "biopet-scatterregions": "0.2--0",
            "vardict-java": "1.5.8--1"
        }
    }

    String prefix = if (defined(controlSample))
        then "~{tumorSample}-~{controlSample}"
        else tumorSample

    call chunkedScatter as scatterList {
        input:
            inputIsBed = defined(regions),
            inputFile = if defined(regions)
             then select_first([regions])
             else reference.dict
    }

    scatter (bed in scatterList.scatters){
        call vardict.VarDict as varDict {
            input:
                tumorSampleName = tumorSample,
                tumorBam = tumorBam,
                normalSampleName = controlSample,
                normalBam = controlBam,
                reference = reference,
                bedFile = bed,
                outputVcf = prefix + "-" + basename(bed) + ".vcf",
                dockerTag = dockerTags["vardict-java"]
        }
    }

    call picard.SortVcf as gatherVcfs {
        input:
            vcfFiles = varDict.vcfFile,
            outputVcfPath = outputDir + "/" + prefix + ".vcf.gz",
            dict = reference.dict,
            dockerTag = dockerTags["picard"]
    }

    output {
        IndexedVcfFile outputVCF = gatherVcfs.outputVcf
    }
}

task chunkedScatter {
    input {
        Int chunkSize = 1000000
        Int minimumSizePerFile = 45000000
        Int overlap = 150
        Boolean inputIsBed = false
        File inputFile

        String dockerTag = "3.7-slim"
    }

    String outDir = "scatters"

    command <<<
        mkdir -p ~{outDir}
        python <<CODE
        from pathlib import Path

        chunk_size = ~{chunkSize}
        minimum_size_per_file = ~{minimumSizePerFile}
        overlap = ~{overlap}
        out_dir = "~{outDir}"
        in_path = Path("~{inputFile}")
        bed_input = ~{true="True" false="False" inputIsBed}

        def dict_chunker(f):
            for line in f.readlines():
                line = line.split()
                if line[0] == "@SQ":
                    for field in line:
                        if field[:2] == "LN":
                            length = int(field.split(":")[1])
                        elif field[:2] == "SN":
                            name = ":".join(field.split(":")[1:])
                    # This will cause the last chunk to be between 0.5 and 1.5
                    # times the chunk_size in length, this way we avoid the
                    # possibility that the last chunk ends up being to small
                    # (eg. 1+overlap bases).
                    position = 0
                    while position + chunk_size*1.5 < length:
                        yield [name, position-overlap, position+chunk_size]
                        position += chunk_size
                    yield [name, position-overlap, length]


        def bed_chunker(f):
            for line in f.readlines():
                line = line.strip().split("\t")
                if line[0] not in ["browser", "track"] and len(line) >= 3:
                    start = int(line[1])
                    end = int(line[2])
                    name = line[0]
                    position = start
                    # This will cause the last chunk to be between 0.5 and 1.5
                    # times the chunk_size in length, this way we avoid the
                    # possibility that the last chunk ends up being to small
                    # (eg. 1+overlap bases).
                    while position + chunk_size*1.5 < end:
                        if position-overlap <= start:
                            yield [name, start, position+chunk_size]
                        else:
                            yield [name, position-overlap, position+chunk_size]
                        position += chunk_size
                    if position-overlap <= start:
                        yield [name, start, position+chunk_size]
                    else:
                        yield [name, position-overlap, position+chunk_size]


        current_scatter = 0
        current_scatter_size = 0
        current_contig = None

        out_file = open("{}/scatter-{}.bed".format(out_dir, current_scatter), "w")
        with in_path.open("r") as in_file:
            chunks = bed_chunker(in_file) if bed_input else dict_chunker(in_file)
            for chunk in chunks:
                if chunk[1] < 0:
                    chunk[1] = 0
                if chunk[0] != current_contig:
                    current_contig = chunk[0]
                    if current_scatter_size >= minimum_size_per_file:
                        out_file.close()
                        current_scatter += 1
                        current_scatter_size = 0
                        out_file = open("{}/scatter-{}.bed".format(out_dir,
                            current_scatter), "w")
                out_file.write("{}\t{}\t{}\n".format(chunk[0], chunk[1], chunk[2]))
                current_scatter_size += (chunk[2]-chunk[1])
            out_file.close()
        CODE
    >>>

    output {
        Array[File] scatters = glob(outDir + "/scatter-*.bed")
    }

    runtime {
        docker: "python:" + dockerTag
        # 4 gigs of memory to be able to build the docker image in singularity
        memory: 4
    }
}