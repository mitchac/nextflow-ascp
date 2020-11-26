process ascp_download {

container 'ibmcom/aspera-cli'

input:
val(input)

output:
tuple val (file_name), val (file_chunk_start), file ("*.fastq.gz"), val(file_chunks_count)

script:
file_path = input[0]
file_chunk_start = input[1]
file_chunk_end = input[2]
file_chunks_count = input[3]

file_name = file(file_path).name

"""
ascp -QT -@${file_chunk_start}:${file_chunk_end} -l 300m -P33001 -i /home/aspera/.aspera/cli/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:${file_path} ${file_name}

cat ${file_name} | dd bs=1 skip=${file_chunk_start} > temp
rm ${file_name}
mv temp ${file_name}
"""
}
