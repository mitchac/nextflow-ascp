nextflow.enable.dsl=2

include {get_reads_from_run} from './modules/get_reads_from_run.nf'
include {get_file_chunks} from './modules/get_file_chunks.nf'
include {download_file_chunk} from './modules/download_file_chunk.nf'
include {combine_file_chunks} from './modules/combine_file_chunks.nf'
include {extract_archive} from './modules/extract_archive.nf'

//using small (~10Mb) paired-end test data set SRR12118866 
Channel.from('SRR12118866').set{ ch_run }

workflow {
    get_reads_from_run(ch_run)
    get_file_chunks(get_reads_from_run.out.splitCsv())
    download_file_chunk(get_file_chunks.out.splitCsv())
    download_file_chunk.out
    .view()
    .collectFile() { item ->
       [ item[0], file(item[2]) ]
    }
    view()
/*    
    //combine_file_chunks(
    download_file_chunk.out
    .map{ tup -> tuple( groupKey(tup[0], tup[3].toInteger()), [tup[0], tup[1], tup[2]] )}
    .groupTuple(sort:{tup -> tup[1]})
    .view()
    //.map { tup -> tup[1] }
    //.splitCsv()
    //.collectFile { id, files -> [ id, files.collect{ it[2] }.join('\n') + '\n' ] }
    .collectFile { id, files -> [ id.take(id.indexOf('.')), files.collect{ it[2] }.join('\n') + '\n' ] }
    //)
    .splitText()
    .view()
    //.collectFile(name: 'sample.txt', newLine: true)
    .collectFile() { item ->
       [ item.substring(item.lastIndexOf("/")+1), file("s3://"+item) ]
    }
    .view()
    //.toList()

    //extract_archive(combine_file_chunks.out)
    //extract_archive.out.view()
*/
}
