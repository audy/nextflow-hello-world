params.in = "sample.fastq"

process countSequences {
    input:
        path input

    output:
        stdout

    """
    pigz -cd $input | wc -l
    """
}

workflow {
    countSequences(params.in) | view
}
