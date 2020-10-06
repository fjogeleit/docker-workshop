#!/bin/bash

docker build . -f solution.dockerfile --tag vue-example

docker run -p 80:80 --name vue-example --rm -d vue-example:latest