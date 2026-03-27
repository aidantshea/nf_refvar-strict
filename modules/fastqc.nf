/*
 * Run fastqc on a given input file
 */
process FASTQC {

    container 'community.wave.seqera.io/library/fastqc:0.12.1--af7a5314d5015c29'

    input:
    path fastq

    output:
    path "${fastq.simpleName}_fastqc.html",     emit: html
    path "${fastq.simpleName}_fastqc.zip",      emit: zip

    script:
    """
    fastqc ${fastq}
    """
}