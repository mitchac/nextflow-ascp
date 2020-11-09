process get_ena_file_size {

container 'meandor/ubuntu-lftp'

input:
val(path)

output:
file "file_size.txt"

script:
"""
echo "du -s ." | lftp ftp://ftp.sra.ebi.ac.uk/vol1/${path} > file_size.txt
"""
}
