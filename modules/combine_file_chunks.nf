process combine_file_chunks{

container 'ubuntu:latest'

input:
//file fragment_paths
file ("*") from fragment_paths

output:
file ("*")

script:
   println fragment_paths
   basename = fragment_paths.baseName
   """
   cat $fragment_paths | while read f; do
      #aws s3 cp s3://emriuom/a1/a6381206cfa97b14e1139a22a71d5c/out.txt out.txt
      #cat out.txt
      #cat ${params.dataprefix}\$f
   done > ${basename}.merged.gz
   """

}
