# Choose OS
FROM ubuntu:16.10

# Install packages
RUN apt-get -y update && apt-get install -y \
  bc \
  bwa \
  build-essential \
  checkinstall \
  default-jre \
  dos2unix \
  gawk \
  nano \
  mc \
  most \
  less \
  parallel \
  perl \
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
RUN wget https://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2/download
RUN mv download samtools.tar.bz2
RUN wget https://sourceforge.net/projects/bbmap/files/latest/download
RUN mv download bbmap.tar.gz
RUN wget http://www.vicbioinformatics.com/barrnap-0.6.tar.gz
RUN wget http://www.vicbioinformatics.com/prokka-1.12.tar.gz
RUN wget http://eddylab.org/infernal/infernal-1.1.2-linux-intel-gcc.tar.gz
RUN wget ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux.tbl2asn.gz
RUN wget https://github.com/hyattpd/Prodigal/releases/download/v2.6.3/prodigal.linux
RUN wget https://github.com/hyattpd/Prodigal/archive/v2.6.3.zip
RUN wget http://mbio-serv2.mbioekol.lu.se/ARAGORN/Downloads/aragorn1.2.38.tgz
RUN wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.6.0+-x64-linux.tar.gz
RUN wget https://github.com/marbl/parsnp/releases/download/v1.2/parsnp-Linux64-v1.2.tar.gz

RUN chown -R workshop-user:workshop-user /home/workshop-user/*

# Bio Perl
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Bio::Perl

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
WORKDIR /home/workshop-user

# Download two Mycoplasma genitalium sra files from NCBI SRA using the sratoolkit command 'prefetch' 
# By default, sra files are stored in directory /home/workshop-user/ncbi/public/sra/
RUN prefetch ERR486835
RUN prefetch ERR486836
