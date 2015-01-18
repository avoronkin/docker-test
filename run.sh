#!/bin/bash

cwd=$(pwd)

sudo docker run -v $cwd:/src -i -t avoronkin/nodejs /bin/bash
