#!/bin/bash

# Run the latest redis image with custom name "redis" in detach (background) mode. Autoremove after container exit
docker run --name redis --rm -d redis:latest

# Run "redis-cli SET workshop docker" within the container
docker exec redis redis-cli SET workshop docker

# Run "redis-cli GET workshop" within the container
docker exec redis redis-cli GET workshop

# Stop the container
docker stop redis

# if you don't use the --rm flag on run use "docker rm" to manuel remove the container
# docker rm redis