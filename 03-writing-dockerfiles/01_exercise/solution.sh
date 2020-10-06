#!/bin/bash

# use -f solution.dockerfile to use the provided solution file
docker build . --tag hello-world -f Dockerfile

docker run -p 81:80 --name hello-world --rm hello-world:latest