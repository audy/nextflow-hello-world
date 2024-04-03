params.in = "sample.fastq"

process countSequences {
    input:
        path input

    output:
        stdout

    """
    gzip -cd $input | wc -l
    """
}

workflow {
    countSequences(params.in) | view
}
