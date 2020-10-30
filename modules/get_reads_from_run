process get_reads_from_run {

container 'alpine:latest'

input:
val(run_id)

output:
stdout:

script:
"""
curl https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp
"""
}
