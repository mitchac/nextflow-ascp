process extract_archive {

container 'ubuntu:latest'

input:
file(archive)

output:
file "*.fastq"

script:
"""
gunzip -f ${archive}
"""
}
