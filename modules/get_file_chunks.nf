process get_file_chunks {

container 'bitnami/python'

input:
val(input)

output:
file 'out.txt'

script:
"""
get_file_chunks.py ${input[0]} ${input[1]} ${params.chunksize}
"""
}
