process get_file_chunks_py {

container 'bitnami/python'

input:
val(input)

output:
file 'out.txt'

script:
"""
get_file_chunks.py ${input}
"""
}
