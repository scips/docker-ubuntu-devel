#!/bin/bash

 cd /root/sphinx/
 ./configure --without-mysql
 make -j4 install

searchd -c sphinx-min.conf.in