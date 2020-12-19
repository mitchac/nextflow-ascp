process download_file_chunk {

container 'ubuntu'

input:
val(input)

output:
file ("*.fastq.gz")

script:
file_path = input
"""
curl -L ftp://ftp.sra.ebi.ac.uk/${file_path}
"""
}
