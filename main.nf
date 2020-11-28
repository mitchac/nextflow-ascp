nextflow.preview.dsl=2

include {get_reads_from_run} from './modules/get_reads_from_run.nf'
include {get_file_chunks_py} from './modules/get_file_chunks_py.nf'
include {ascp_download} from './modules/ascp_download.nf'
include {combine_file_chunks} from './modules/combine_file_chunks.nf'
include {extract_archive} from './modules/extract_archive.nf'

//using small (~10Mb) paired-end test data set SRR12118866 
Channel.from('SRR12118866').set{ ch_run }

workflow {
    get_reads_from_run(ch_run)
    get_file_chunks_py(get_reads_from_run.out.splitCsv())
    ascp_download(get_file_chunks_py.out.splitCsv())
    //.view()
    combine_file_chunks(
    ascp_download.out
    .map{ tup -> tuple( groupKey(tup[0], tup[3].toInteger()), [tup[0], tup[1], tup[2]] )}
    .groupTuple(sort:{tup -> tup[1]})
    .map {tup -> tup[1]}    
    )
    extract_archive(combine_file_chunks.out)
    extract_archive.out.view()
}
