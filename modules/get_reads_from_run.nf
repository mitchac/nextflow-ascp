process get_reads_from_run {

container 'curlimages/curl:latest'

input:
val(run_id)

output:
file 'reads.txt'

script:
"""
#!/usr/bin/curl
curl 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp' > reads.txt 
"""
}
