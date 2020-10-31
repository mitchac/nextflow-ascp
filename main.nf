nextflow.preview.dsl=2

include {ascp_download} from './modules/ascp_download.nf'
include {extract_archive} from './modules/extract_archive.nf'
include {get_reads_from_run} from './modules/get_reads_from_run.nf'

//Channel.from('vol1/fastq/SRR144/004/SRR1448774/SRR1448774.fastq.gz','vol1/fastq/SRR307/SRR307897/SRR307897_1.fastq.gz').set{ ch_paths }
//Channel.from('vol1/fastq/SRR992/003/SRR9924523/SRR9924523.fastq.gz','vol1/fastq/SRR992/002/SRR9924522/SRR9924522.fastq.gz').set{ ch_paths }
//small (~10Mb) test paired-end phage data set SRR12118866 

workflow {
    get_reads_from_run('SRR12118866')
    ascp_download(get_reads_from_run.out.splitText( by: 1 ))
    //ascp_download(ch_paths)
    //extract_archive(ascp_download.out)
    //get_reads_from_run('ERR1739691')
}
