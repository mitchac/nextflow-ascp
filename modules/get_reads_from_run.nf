process get_reads_from_run {

container 'ellerbrock/alpine-bash-curl-ssl:latest'

input:
val(run_id)

output:
file 'reads.txt'

script:
"""
#!/bin/sh
# curl 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp' 
"""
}
