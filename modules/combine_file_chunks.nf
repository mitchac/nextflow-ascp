process combine_file_chunks{

container 'ubuntu:latest'

input:
path(file_fragments)

output:
file ("*.gz")

script:
file_name = file_fragments[0].toString().substring(16)
"""
ls -v *.fastq.gz | xargs cat > combined
rm *.fastq.gz
mv combined ${file_name}.gz
"""
}
