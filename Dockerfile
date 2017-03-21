FROM ubuntu:16.04

MAINTAINER Sébastien Barbieri (SCIPS) <sebastien.barbieri@gmail.com>

RUN apt-get -y update && apt-get install -y build-essential autoconf automake checkinstall git

