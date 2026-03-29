/*
 * Trim adapters with FASTP
 */
process FASTP {

    container 'community.wave.seqera.io/library/fastp:1.3.0--68fee5ea383e98b6'

    input:
    path fastq
    path adapters

    output:
    path "${fastq.simpleName}.fastp.fastq.gz",  emit: fastp_reads
    path "${fastq.simpleName}.fastp.html",      emit: fastp_html
    path "${fastq.simpleName}.fastp.json",      emit: fastp_json

    script:
    prefix = fastq.simpleName
    """
    fastp \\
        --in1 ${prefix}.fastq.gz \\
        --out1 ${prefix}.fastp.fastq.gz \\
        --json ${prefix}.fastp.json \\
        --html ${prefix}.fastp.html \\
        --adapter_fasta ${adapters}
    """
}