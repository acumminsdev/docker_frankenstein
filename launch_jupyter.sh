#!/bin/bash

docker run -d -p 8888:8888 -v $PWD/.:/home/jovyan/work docker_frankenstein/model 
