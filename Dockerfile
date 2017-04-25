# Choose OS
FROM ubuntu:16.10

# Install packages
RUN apt-get -y update && apt-get install -y \
  bc \
  bwa \
  default-jre \
  dos2unix \
  nano \
  mc \
  most \
  less \
  python3 \
  samtools \
  varscan \
  vim \
  wget 

# Add user
RUN useradd -ms /bin/bash workshop-user

# Download required software
WORKDIR /home/workshop-user/download
RUN wget http://spades.bioinf.spbau.ru/release3.10.1/SPAdes-3.10.1-Linux.tar.gz
RUN wget http://download.asperasoft.com/download/sw/ascp-client/3.5.4/ascp-install-3.5.4.102989-linux-64.sh
RUN wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2/sratoolkit.2.8.2-ubuntu64.tar.gz
RUN wget https://github.com/dghm-genomics/Binfo_seminar_toolbox/archive/1.1.tar.gz
RUN chown -R workshop-user:workshop-user /home/workshop-user/*

# Install ascp (this is optional for sratoolkit below)
RUN chmod 755 ascp-install-3.5.4.102989-linux-64.sh
RUN ./ascp-install-3.5.4.102989-linux-64.sh

# Install SPAdes
WORKDIR /opt
RUN tar -xzf /home/workshop-user/download/SPAdes-3.10.1-Linux.tar.gz
RUN ln -s /opt/SPAdes-3.10.1-Linux/bin/* /usr/bin/

# Install sratoolkit
RUN tar -xzf /home/workshop-user/download/sratoolkit.2.8.2-ubuntu64.tar.gz
RUN ln -s /opt/sratoolkit.2.8.2-ubuntu64/bin/* /usr/bin/

# Install Binfo seminar toolbox
RUN tar -xzf /home/workshop-user/download/1.1.tar.gz
RUN chmod 755 /opt/Binfo_seminar_toolbox-1.1/*.sh
RUN ln -s /opt/Binfo_seminar_toolbox-1.1/* /usr/bin/

# Change user
USER workshop-user

# Download two Mycoplasma genitalium sra files from NCBI SRA using the sratoolkit command 'prefetch' 
# By default, sra files are stored in directory /home/workshop-user/ncbi/public/sra/
RUN prefetch ERR486835
RUN prefetch ERR486836

# Change to directory /home/workshop-user
WORKDIR /home/workshop-user
