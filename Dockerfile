# Choose OS
FROM ubuntu:16.10

# Install packages
RUN apt-get -y update && apt-get install -y \
  python3.5 \
  wget

# Install SPAdes
WORKDIR /root/download
RUN wget http://cab.spbu.ru/files/release3.9.1/SPAdes-3.9.1-Linux.tar.gz
WORKDIR /opt
RUN tar -xzf /root/download/SPAdes-3.9.1-Linux.tar.gz
RUN ln -s /opt/SPAdes-3.9.1-Linux/bin/spades /usr/bin/spades

# Further TODOs
#   Install other software
#   Download raw sequence data?
#   Add users?
#
