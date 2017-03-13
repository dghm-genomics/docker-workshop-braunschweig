# Choose OS
FROM ubuntu:16.10

# Install packages
RUN apt-get -y update && apt-get install -y \
  python3.5 \
  wget
  
# add softlink for python
RUN ln -s /usr/bin/python3.5 /usr/bin/python

# Download software
WORKDIR /root/download
RUN wget http://spades.bioinf.spbau.ru/release3.10.1/SPAdes-3.10.1-Linux.tar.gz
RUN wget http://download.asperasoft.com/download/sw/ascp-client/3.5.4/ascp-install-3.5.4.102989-linux-64.sh
RUN wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2/sratoolkit.2.8.2-ubuntu64.tar.gz

# Install ascp
RUN chmod u+x ascp-install-3.5.4.102989-linux-64.sh
RUN ./ascp-install-3.5.4.102989-linux-64.sh

# Install SPAdes
WORKDIR /opt
RUN tar -xzf /root/download/SPAdes-3.10.1-Linux.tar.gz
RUN ln -s /opt/SPAdes-3.10.1-Linux/bin/* /usr/bin/

# Install sratoolkit
RUN tar -xzf /root/download/sratoolkit.2.8.2-ubuntu64.tar.gz
RUN ln -s /opt/sratoolkit.2.8.2-ubuntu64/bin/* /usr/bin/

# Download Mycoplasma genitalium sra files from NCBI SRA using the command prefetch
RUN prefetch ERR486835
RUN prefetch ERR486836

# Download Mycoplasma genitalium reads from NCBI SRA
#WORKDIR /root/download/fastq
#RUN fastq-dump --split-files ERR486835
#RUN fastq-dump --split-files ERR486836
