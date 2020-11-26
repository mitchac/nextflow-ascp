process combine_file_chunks{

container 'ubuntu:latest'

input:
val(input)

output:
file ("*.fastq.gz")

script:
paths = ""
input.each {
    paths+= "\""
    paths+= it[2]
    paths+= "\"" 
    paths+= " "
}

file_name = input[0][0]

"""
declare -a arr=(${paths})

for i in "\${arr[@]}"
do
   cat "\$i" >> ${file_name}
done
"""
}
