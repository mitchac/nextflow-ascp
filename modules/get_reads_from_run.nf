process get_reads_from_run {

container 'tutum/curl:latest'

input:
val(run_id)

output:
//file 'reads.txt'
stdout

script:
"""
curl -k 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp' \
  | grep -Po 'vol.*?fastq.gz' 
"""
}
