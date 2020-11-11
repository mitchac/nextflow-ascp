process get_reads_from_run {

container 'tutum/curl:latest'

input:
val(run_id)

output:
//file 'ftp.txt'
//file 'bytes.txt'  
file 'out.txt'

script:
"""
curl -k 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_ftp' \
  | grep -Po 'vol.*?fastq.gz' \
  > ftp.txt
curl -L -k 'http://www.ebi.ac.uk/ena/portal/api/filereport?accession=${run_id}&result=read_run&fields=fastq_bytes' \
  | grep -Po '[0-9]*' | sed -n '1!p' \
  > bytes.txt
paste -d, ftp.txt bytes.txt > out.txt
"""
}
