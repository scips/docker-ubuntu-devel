FROM ubuntu:16.04

LABEL be.sbw.ubuntu-package.ripgrep.maintainer="Sébastien Barbieri (SCIPS) <sebastien.barbieri@gmail.com>"
LABEL be.sbw.ubuntu-package.ripgrep.version="0.1"
LABEL be.sbw.ubuntu-package.ripgrep.description="Ubuntu Builder Docker for ripgrep ubuntu package"

# to build: docker build -t docker-ubuntu-devel:ripgrep-latest .
# to run: docker run -it docker-ubuntu-devel:ripgrep-latest

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils build-essential autoconf automake checkinstall
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git dh-make packaging-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim
RUN locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
WORKDIR /root/download/
RUN wget -O rust-setup.sh https://sh.rustup.rs && chmod +x rust-setup.sh && ./rust-setup.sh -y
RUN /bin/bash -c "bzr whoami 'Sébastien Barbieri <sebastien.barbieri@gmail.com>'; bzr launchpad-login sebastien-barbieri"
ENV DEBEMAIL="sebastien.barbieri@gmail.com" DEBFULLNAME="Sébastien Barbieri"
COPY ./rust-build.sh /root/rust-build.sh
WORKDIR /root/
