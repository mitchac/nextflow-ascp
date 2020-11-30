process extract_archive {

container 'ubuntu:latest'

input:
file(archive)

output:
file "*"

script:
"""
gunzip -f ${archive}
"""
}
