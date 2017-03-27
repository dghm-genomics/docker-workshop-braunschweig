# Dockerfile for workshop in Braunschweig

Please find here the Dockerfile for an image to be used at a [workshop on genome assemby and annotation in Braunschweig](https://www.dsmz.de/home/news-and-events/events/genomics-workshop.html "website of the workshop hosted at DSMZ") in May 2017.

## Quick start 

Please watch our introductory webcast by clicking on the image below. The webcast shows you how to download ("pull") the image specified by the presented Dockerfile and how to start working with it.

[<img src="https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F623705475_450x300.jpg&amp;src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png">](https://vimeo.com/208399207)

## Table of contents

*  [Requirements](#requirements)
*  [Questions](#questions)
    * [What is a Dockerfile?](#what-is-a-dockerfile)
    * [What is Docker?](#what-is-docker)
    * [Why is Docker used for this workshop?](#why-is-docker-used-for-this-workshop)
*  [Getting started](#getting-started)
    * [Install Docker](#install-docker)
    * [Start Docker and download the image described by the presented Dockerfile](#start-docker-and-download-the-image-described-by-the-presented-dockerfile)
    * [Interact with the image](#interact-with-the-image)
    * [Optional: add a volume](#optional-add-a-volume)
*  [Information about referenced software and data](#information-about-referenced-software-and-data)
    * [SPAdes](#spades)
    * [NCBI's Sequence Read Archive](#ncbis-sequence-read-archive)

## Requirements

In order to get the Docker image up and running you need the following equipment and skills:

*  Access to a computer with a 64-bit operating system with at least 8 GB of RAM. Please see the [installation section](#install-docker) to see which operating systems are currently supported. You also need administrator privileges in order to install Docker.
*  Basic knowledge of the Linux shell. If you need a refresher, please visit the page [Learning the shell](http://linuxcommand.org/lc3_learning_the_shell.php). The most important commands you need here are those for [navigation](http://linuxcommand.org/lc3_lts0030.php) and [file manipulation](http://linuxcommand.org/lc3_lts0050.php)

## Questions

### What is a Dockerfile?

A Dockerfile is a text document that contains all the commands to assemble a Docker image. A Docker image is an emulation of a computer environment, ready with operating system, installed programs, files etc. 

### What is Docker?

Docker is an open-source project that automates the deployment of applications inside software containers. A container is a runtime instance of a docker image.

### Why is Docker used for this workshop?

Docker is a quick way to get you started with a pre-specified software environment without losing time on manual installation of dependencies, downloading files etc. The goal of above workshop is to get you to experiment with programs presented at the workshop as quickly as possible.

## Getting started

The following subsections will point you to instructions for installation of Docker on your operating system. After installation, you will learn how to work with an instance of the image.

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

### Start Docker and download the image described by the presented Dockerfile

Once you have successfully installed Docker you can immediatly start working with it. On Windows, you will have to doubleclick on the appropriate icon (Docker Community Edition or Docker Toolbox) to fire up Docker. 

The image described can be pulled (i.e. downloaded) by issuing the command

    $ docker pull dghmgenomics/workshop-braunschweig

Please note, that on Linux the command has to be preceded by 'sudo' if you are not logged in with root privileges.

To verify that the image has been downloaded, type the command

    $ docker images

If the image has been downloaded, you will get a message similar to this:

    REPOSITORY                           TAG        IMAGE ID        CREATED        SIZE
    dghmgenomics/workshop-braunschweig   latest     788ab87feb5d    11 days ago    547.8 MB

Please note, that contents of fields "IMAGE ID" and "CREATED" will differ for your image.

### Interact with the image

Type the following command to interact with the downloaded image:

    $ docker run -it dghmgenomics/workshop-braunschweig
    
If successful, you will be greeted with a command line prompt from within the started container, similar to the following:

    root@e07c71035c6a:/data/fastq#
    
To exit from the container simply type "exit", as shown below, and press "Return":

    root@e07c71035c6a:/data/fastq# exit
    exit
    
### Optional: add a volume

By specifying a local directory with the -v option you can add a local directory, which can be accessed from within the Docker container.

E.g. the command

    $ docker run -it -v /temp/export:/export dghmgenomics/workshop-braunschweig

allows you to write data into the directory /export from within the container. Data will persist in the local directory /temp/export and remains available even after the container was stopped or killed.

Please note that Windows directories can only be accessed by prepending the disk letter; e.g. to specify "C:\temp" you would have to write "/c/temp". It's always a good idea to type "pwd" (=present working directory) from Docker to see which directory Docker is accessing by default. On my Windows computer, the command "pwd" yields the following result:

 ![Windows screenshot](https://github.com/dghm-genomics/docker-workshop-braunschweig/blob/master/images/pwd.png?raw=true)

### Start SPAdes

Once within the container, test SPAdes by typing

    $ spades.py --test

If successful, a long log will be output to your screen finishing with

    ========= TEST PASSED CORRECTLY.

    SPAdes log can be found here: /data/fastq/spades_test/spades.log

    Thank you for using SPAdes!

Please watch the [webcast](#quick-start) for further tasks you can complete. These include downloading data from the NCBI Sequence Read Archive, extracting data in the fastq format and assembling reads with SPAdes.

## Information about referenced software and data

### SPAdes

SPAdes is a genome assembler that has gained popularity for the assembly of prokaryotic genomes. Please visit [the SPAdes website](http://cab.spbu.ru/software/spades/) for information on how to use it.

### NCBI's Sequence Read Archive

The [Sequence Read Archive (SRA)](https://trace.ncbi.nlm.nih.gov/Traces/sra/) stores raw sequence data from "next-generation" sequencing technologies. Accession no. [ERR486835](https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=ERR486835) and [ERR486836](https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=ERR486836) represent two randomly chosen Illumina MiSeq paired end sequencing reads of *Mycoplasma genitalium*. The [SRA toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software) allows download and conversion of raw data into different formats.
