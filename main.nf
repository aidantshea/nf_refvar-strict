#!/usr/bin/env nextflow

/*
 * Run fastqc on a given input file
 */
process FASTQC {

    container 'community.wave.seqera.io/library/fastqc:0.12.1--af7a5314d5015c29'

    input:
    path fastq

    output:
    path "*_fastqc.html",   emit: html
    path "*_fastqc.zip",    emit: zip

    script:
    """
    fastqc ${fastq}
    """
}

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