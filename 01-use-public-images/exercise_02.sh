#!/bin/bash

# Run the latest postgres alpine image with custom name "postgres" in detach (background) mode. Autoremove after container exit 
# Customize credentials with ENV variables
# Mount  the scripts folder into the /docker-entrypoint-initdb.d folder
docker run --name postgres --rm -d -e POSTGRES_USER=moveelevator -e POSTGRES_PASSWORD=test56 -e POSTGRES_DB=workshop -v "$(pwd)/scripts:/docker-entrypoint-initdb.d" postgres:alpine

# Wait for DB setup completion
sleep 5

# Run "psql SELECT" within the container
docker exec postgres psql -U moveelevator -w -d workshop -c "SELECT * FROM workshops;"

# Stop the container
docker stop postgres

# if you don't use the --rm flag on run use "docker rm" to manuel remove the container
# docker rm postgres