process download_file_ascp {

container 'tutum/curl:latest'

input:
val(input)

output:
file ("*.fastq.gz")

script:
file_path = input[0]
file_name = file(file_path).name
"""
ascp -QT -l 300m -P33001 -i /root/.aspera/cli/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:${file_path} ${file_name}:q
"""
}
