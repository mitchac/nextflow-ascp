process test {

container 'ubuntu:latest'

input:
val file_path

output:
file "*"

script:
"""
cat $file_path > out.txt
"""
}
