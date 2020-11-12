process ascp_download {

container 'ibmcom/aspera-cli'

input:
val(input)

output:
tuple val (file_path), val (file_chunk_start), val (file_chunk_end), file ("*.fastq.gz")

script:
file_path = input[0]
file_chunk_start = input[1]
file_chunk_end = input[2]

f = file(input[0]).name
println f
"""
ascp -QT -@${input[1]}:${input[2]} -l 300m -P33001 -i /home/aspera/.aspera/cli/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:${input[0]} ${f}
"""
}
