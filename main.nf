#!/usr/bin/env nextflow

// Modules
include { FASTQC } from './modules/fastqc.nf'

/*
 * Pipeline parameters
 */
params {
    samplesheet: Path
}

workflow {

    main:
    fastq_ch = channel.fromPath(params.samplesheet)
        .splitCsv(header: true)
        .flatMap { row -> file(row.fastq_1) }

    FASTQC(fastq_ch)

    publish: 
    report  = FASTQC.out.html
    zipfile = FASTQC.out.zip
}

output {
    report {
        path 'fastqc'
    }
    zipfile {
        path 'fastqc'
    }
}