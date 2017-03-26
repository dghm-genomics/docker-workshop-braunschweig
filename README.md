# Dockerfile for workshop in Braunschweig

Please find here the Dockerfile for an image to be used at a [workshop on genome assemby and annotation in Braunschweig](https://www.dsmz.de/home/news-and-events/events/genomics-workshop.html "website of the workshop hosted at DSMZ") in May 2017.

## Getting started

In order to work with the presented Dockerfile you have to install Docker, which is an open-source project that automates the deployment of applications inside software containers.

### Install Docker

Docker can be installed for free on many different operating systems including Windows, Mac, and many Linux distributions.

#### Install Docker for Windows

If you have Windows 10 Professional or Enterprise 64-bit, you should install the [Docker Community Edition for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows). For other Windows versions, use [Docker Toolbox](https://www.docker.com/products/docker-toolbox). Please refer to Docker's [Windows instructions](https://www.docker.com/docker-windows) for more information.

#### Install Docker for Mac

If you have Apple Mac OS Yosemite 10.10.3 or above, you should install the [Docker Community Edition for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac). For other versions, use [Docker Toolbox](https://www.docker.com/products/docker-toolbox). Please refer to Docker's [Mac instructions](https://www.docker.com/docker-mac) for more information.

#### Install Docker for Ubuntu

You can use Docker on 64-bit versions of Ubuntu 14.04 and above by installing the [Docker Community Edition for Ubuntu](https://store.docker.com/editions/community/docker-ce-server-ubuntu). Please refer to Docker's [Ubuntu instructions](https://www.docker.com/docker-ubuntu) for more information.

#### Install Docker for other operating systems or environments

Please visit the [Docker homepage](http://www.docker.com) to learn about Docker for AWS, Docker for Azure, Docker for Windows Server, Docker for the CentOS distribution, Docker for Debian, Docker for Fedora®, Docker for Oracle Linux, Docker for RHEL, and Docker for SLES.

### Start Docker and download ("pull") the image described by the presented Dockerfile

Once you have started Docker on your OS the image described can be pulled (i.e. downloaded) by issuing the command

    $ docker pull dghmgenomics/workshop-braunschweig

To verify that the image has been downloaded, type the command

    $ docker images

If the image has been downloaded, you will get a message similar to this:

    REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
    dghmgenomics/workshop-braunschweig   latest              788ab87feb5d        11 days ago         547.8 MB


### Webcast

Please watch our introductory webcast by clicking on the image below:

[<img src="https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F623705475_450x300.jpg&amp;src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png">](https://vimeo.com/208399207)



    
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

