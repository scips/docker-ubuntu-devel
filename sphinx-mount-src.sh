#!/bin/bash

docker run -v /home/scips/Workspace/scips/sphinx:/root/sphinx -v /home/scips/Workspace/scips/sphinx-docker/sphinx-build.sh:/root/sphinx-build.sh -it scips/ubuntu-devel:16.04 bash