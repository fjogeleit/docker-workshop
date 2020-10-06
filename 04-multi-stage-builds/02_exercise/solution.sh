#!/bin/bash

docker build . -f Dockerfile --tag vue-example

docker run -p 80:80 --name vue-example --rm -d vue-example:latest