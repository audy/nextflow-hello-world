process countSequences {
    container "ubuntu:latest"

    input:
    path fastqPath

    output:
    path 'line-count.txt'

    """
    echo "############# counting lines"

    gzip -cd $fastqPath | wc -l  > line-count.txt
    """
}

process summarizeCounts {
    container "python:latest"

    input:
    val readCounts

    output:
    path 'summary.txt'

    """
#!/usr/bin/env python3

print('summarizing counts!')
with open('summary.txt', 'w') as handle:
    handle.write('finished!')
    """
}

workflow {
    channel.fromPath("input-files/*.fastq.gz")
    | countSequences
    | summarizeCounts
    | view
}
