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

"""
declare -a arr=(${paths})

for i in "\${arr[@]}"
do
   cat "\$i" >> ${input[0][0]}
done
"""
}
