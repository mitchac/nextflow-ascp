process ascp_download {

container 'ibmcom/aspera-cli'

input:
val(input)

output:
file "*.fastq.gz"

script:
input[0] = input[0].substring(1)
input[2] = input[2].substring(1, input[2].length() - 1)     

"""
ascp -QT -@${input[1]}:${input[2]} -l 300m -P33001 -i /home/aspera/.aspera/cli/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:${input[0]} .
"""
}
