nextflow.enable.dsl=2

include {get_reads_from_run} from './modules/get_reads_from_run.nf'
include {get_file_chunks} from './modules/get_file_chunks.nf'
include {download_file} from './modules/download_file.nf'
include {combine_file_chunks} from './modules/combine_file_chunks.nf'
include {extract_archive} from './modules/extract_archive.nf'

params.sra_accessions = 'SRR12118866'

//using small (~10Mb) paired-end test data set SRR12118866 
Channel.from(params.sra_accessions).set{ ch_run }

workflow {
    get_reads_from_run(ch_run)
    download_file_ascp(get_reads_from_run.out.splitCsv())
    extract_archive(download_file.out)
    extract_archive.out.view()
}

/*
workflow {
    get_reads_from_run(ch_run)
    get_file_chunks(get_reads_from_run.out.splitCsv())
    download_file_chunk(get_file_chunks.out.splitCsv())
    combine_file_chunks(
    download_file_chunk.out
    .map{ tup -> tuple( groupKey(tup[0], tup[3].toInteger()), [tup[0], tup[1], tup[2]] )}
    .groupTuple(sort:{tup -> tup[1]})
    .map { id, files -> files.collect{ it[2] } }
    )
    extract_archive(combine_file_chunks.out)
    extract_archive.out.view()
}
*/
