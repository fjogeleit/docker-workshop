#!/bin/bash

docker build . -f solution.dockerfile --tag symfony-example

docker run -p 9501:9501 --name symfony-example --rm -d symfony-example:latest