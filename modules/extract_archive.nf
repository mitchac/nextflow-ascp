process extract_archive {

errorStrategy 'retry'
maxErrors 5

input:
file(archive)

output:

script:
"""
gunzip -f ${archive}
"""
}
