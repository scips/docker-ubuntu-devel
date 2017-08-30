# docker-ubuntu-devel

Made on top of Ubuntu:16.04

Simply do

    docker build .

to build this docker

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

## Ripgrep

[Ripgrep](https://github.com/BurntSushi/ripgrep) is a super fast system grep that is written in RUST and use multi-core when available

### Install Rust

    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env

### Install & compile ripgrep

    cargo install ripgrep

### Package **rg**

    mkdir deb-package-ripgrep
    cd deb-package-ripgrep
    wget https://github.com/BurntSushi/ripgrep/archive/0.5.0.tar.gz
    mv 0.5.0.tar.gz ripgrep_0.5.0.orig.tar.gz
    bzr whoami "Sébastien Barbieri <sebastien.barbieri@gmail.com>"
    bzr launchpad-login sebastien-barbieri
    export DEBEMAIL="sebastien.barbieri@gmail.com"
    export DEBFULLNAME="Sébastien Barbieri"
    bzr dh-make ripgrep 0.5 ripgrep_0.5.0.orig.tar.gz
    cd ripgrep/debian
    rm *ex *EX



## Maintenance

### Building this docker

docker build -t docker-ubuntu-devel:ripgrep-latest .

