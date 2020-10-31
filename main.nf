nextflow.preview.dsl=2

include {ascp_download} from './modules/ascp_download.nf'
include {extract_archive} from './modules/extract_archive.nf'
include {get_reads_from_run} from './modules/get_reads_from_run.nf'

//using small (~10Mb) paired-end test data set SRR12118866 

workflow {
    get_reads_from_run('SRR12118866')
    ascp_download(get_reads_from_run.out.splitText().map{it -> it.trim()})
    extract_archive(ascp_download.out)
}
