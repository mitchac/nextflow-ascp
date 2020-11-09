nextflow.preview.dsl=2

include {get_reads_from_run} from './modules/get_reads_from_run.nf'
include {ascp_download} from './modules/ascp_download.nf'
include {extract_archive} from './modules/extract_archive.nf'

//using small (~10Mb) paired-end test data set SRR12118866 
Channel.from('SRR12118866').set{ ch_run }

def file_size = 9500
def chunk_size = 1000
def range = (0..file_size).step(chunk_size)
Channel.from(range).map { start_pos -> [start_pos,Math.min(start_pos+chunk_size-1,file_size)]}.view()

workflow {
    //get_reads_from_run(ch_run)
    //ascp_download(get_reads_from_run.out.splitText().map{it -> it.trim()})
    //extract_archive(ascp_download.out)
}
