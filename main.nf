#!/usr/bin/env nextflow

// Modules
include { FASTQC } from './modules/fastqc.nf'
include { FASTP  } from './modules/fastp.nf'

/*
 * Pipeline parameters
 */
params {
    samplesheet: Path
    adapter_list: Path
}

workflow {

    main:
    fastq_ch = channel.fromPath(params.samplesheet)
        .splitCsv(header: true)
        .flatMap { row -> file(row.fastq_1) }

    FASTQC(fastq_ch)

    FASTP(fastq_ch, params.adapter_list)

    publish: 
    report  = FASTQC.out.html
    zipfile = FASTQC.out.zip
    fastp_reads = FASTP.out.fastp_reads
    fastp_html = FASTP.out.fastp_html
    fastp_json = FASTP.out.fastp_json
}

output {
    report {
        path 'fastqc'
    }
    zipfile {
        path 'fastqc'
    }
    fastp_reads {
        path 'fastp'
    }
    fastp_html {
        path 'fastp'
    }
    fastp_json {
        path 'fastp'
    }
}