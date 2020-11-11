process get_file_chunks {

container 'ubuntu:latest'

input:
val(input)

output:
file 'out.txt'

script:
def file_size = input[1].toInteger()
def chunk_size = 1000000
def rng_step = (0..file_size).step(chunk_size)
def myList = rng_step.toSorted().collect { start_pos -> [input[0],start_pos,Math.min(start_pos+chunk_size-1,file_size)]}.flatten().join(',')

"""
"""
}
