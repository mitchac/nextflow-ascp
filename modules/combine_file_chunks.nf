process combine_file_chunks{

container 'ubuntu:latest'

input:
file fragment_paths

output:
file ("*")

script:
   println fragment_paths
   basename = fragment_paths.baseName
   """
   cat $fragment_paths | while read f; do
      cat ${params.dataprefix}\$f
   done > ${basename}.merged.gz
   """

}
