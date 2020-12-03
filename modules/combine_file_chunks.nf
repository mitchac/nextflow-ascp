process combine_file_chunks{

container 'ubuntu:latest'

input:
path ("*") 

output:
file ("all.fastq.gz")

script:
"""
ls -v *.fastq.gz | xargs cat > combined
mv combined all.fastq.gz
"""

}
