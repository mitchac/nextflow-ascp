process extract_archive {

container 'ubuntu:latest'

input:
file(arc

output:
file "*.fastq"

script:
"""
gunzip -f ${archive}
"""
}
