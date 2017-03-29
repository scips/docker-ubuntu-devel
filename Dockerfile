FROM ubuntu:16.04

MAINTAINER Sébastien Barbieri (SCIPS) <sebastien.barbieri@gmail.com>

RUN apt-get -y update && apt-get install -y build-essential autoconf automake checkinstall
RUN apt-get install -y git
RUN apt-get install -y dh-make
RUN apt-get install -y packaging-dev
RUN apt-get install -y vim
RUN locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
RUN cd ~; wget -O rust-setup.sh https://sh.rustup.rs && chmod +x rust-setup.sh && ./rust-setup.sh -y
RUN /bin/bash -c "bzr whoami 'Sébastien Barbieri <sebastien.barbieri@gmail.com>'; bzr launchpad-login sebastien-barbieri; export DEBEMAIL='sebastien.barbieri@gmail.com'; export DEBFULLNAME='Sébastien Barbieri'"
