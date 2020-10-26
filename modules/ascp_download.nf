process ascp_download {
container 'ibmcom/aspera-cli'
errorStrategy 'retry'
maxErrors 5


input:
val(path)

output:
file "*.fastq.gz"

script:
"""
ascp -QT -l 300m -P33001 -i /home/aspera/.aspera/cli/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:${path} .
"""
}
