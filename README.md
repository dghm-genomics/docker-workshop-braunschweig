# Dockerfile for workshop in Braunschweig

Please find here the Dockerfile for an image to be used at a [workshop on genome assemby and annotation in Braunschweig](https://www.dsmz.de/home/news-and-events/events/genomics-workshop.html "website of the workshop hosted at DSMZ") in May 2017.

## Getting started

### Webcast

Please watch our introductory webcast by clicking on the image below:

[<img src="https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F623705475_450x300.jpg&amp;src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png">](https://vimeo.com/208399207)

### Install Docker

Docker can be installed on many different platforms including [Windows](https://www.docker.com/docker-windows), [Mac](https://www.docker.com/docker-mac), [Ubuntu](https://www.docker.com/docker-ubuntu), or other Linux distros. Click the appropriate link to learn how to proceed for your platform.

### Pull the image

The image described in the Dockerfile can be pulled (i.e. downloaded) by issing the command

    $ docker pull dghmgenomics/workshop-braunschweig
    
### Interact with the image

Type the following command to interact with the downloaded image:

    $ docker run -it dghmgenomics/workshop-braunschweig
    
### Add a volume

By specifying a local directory with the -v option you can add a local directory, which can be accessed from within the Docker container.

The command

    $ docker run -it -v /temp/export:/export dghmgenomics/workshop-braunschweig

allows you to write data into the directory /export from within the container. Data will persist in the local directory /temp/export and remains available even after the container was stopped or killed.

## Information about referenced software and data

### SPAdes

SPAdes is a genome assembler that has gained popularity for the assembly of prokaryotic genomes. Please visit [the SPAdes website](http://cab.spbu.ru/software/spades/) for information on how to use it.

### NCBI's Sequence Read Archive

The [Sequence Read Archive (SRA)](https://trace.ncbi.nlm.nih.gov/Traces/sra/) stores raw sequence data from "next-generation" sequencing technologies. Accession no. [ERR486835](https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=ERR486835) and [ERR486836](https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=ERR486836) represent two randomly chosen Illumina MiSeq paired end sequencing reads of *Mycoplasma genitalium*. The [SRA toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software) allows download and conversion of raw data into different formats.

## More info

Visit [the Docker website](https://www.docker.com) to learn about Dockerfiles and how to use them.

