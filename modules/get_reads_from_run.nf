process get_reads_from_run {

container 'ubuntu:latest'

input:
val(run_id)

output:
file 'reads.txt'

script:
"""
wget 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp' -O reads.txt 
"""
}
