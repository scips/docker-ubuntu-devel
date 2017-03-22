# docker-ubuntu-devel

Made on top of Ubuntu:16.04

Used to test make / make install of c/c++ programs

## Sphinxsearch

[Sphinx search](http://sphinxsearch.com/) is a service that allow you to combine indexes and do fast search inside them

I first clone from github the project on a local directory: /home/scips/workspace/sphinx/
To run the docker I need to mount the src code from my host directory.

    docker run -v /home/scips/workspace/sphinx/:/root/sphinx -it scips/ubuntu-devel:16.04 bash

Then inside the docker I compile, install and test

     cd /root/sphinx/
     ./configure --without-mysql
     make -j4 install
     indextool --checkconfig

That's it!

## Ripgrup

[Ripgrup](https://github.com/BurntSushi/ripgrep) is a super fast system grep that is written in RUST and use multi-core when available

## Maintenance

### Building this docker

docker build -t docker-ubuntu-devel .

