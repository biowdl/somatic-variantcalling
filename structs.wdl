version 1.0

import "tasks/common.wdl"

struct TrainingSet {
    File truthIndel
    File truthSNV
    IndexedBamFile tumorBam
    IndexedBamFile? normalBam
    File? mutect2VCF
    File? varscanSNV
    File? varscanIndel
    File? jsmVCF
    File? somaticsniperVCF
    File? vardictVCF
    File? museVCF
    File? lofreqSNV
    File? lofreqIndel
    File? scalpelVCF
    File? strelkaSNV
    File? strelkaIndel
}