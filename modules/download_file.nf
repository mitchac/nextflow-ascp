process download_file {

container 'tutum/curl:latest'

input:
val(input)

output:
file ("*.fastq.gz")

script:
file_path = input[0]
file_name = file(file_path).name
"""
curl -L ftp://ftp.sra.ebi.ac.uk/${file_path} -o ${file_name}
"""
}
