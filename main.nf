nextflow.enable.dsl=2

include {test} from './modules/test.nf'

//using small (~10Mb) paired-end test data set SRR12118866 
Channel.from('SRR12118866').set{ ch_run }

Channel.from('s3://emriuom/tmp/0d/0ea4d57fc3dd28c45ed4ca256fff0e/bin/get_file_chunks.py').set{ ch_test }

workflow {
test(ch_test)
test.out.view()
}
