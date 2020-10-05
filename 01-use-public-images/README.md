# Using public Images

One of the biggest public docker image registries is [DockerHub](https://hub.docker.com/)

Without any bigger knowledge about Dockerfiles or -Images you can setup and use many services for local Development like MySQL, PostgreSQL or Redis

## Exercise #1: Start a local Redis instance
* use the public redis:latest image 
* name the container "redis"
* run the container in the background

## Exercise #1.1: Exec Commands within the Container
* use docker exec to set the KEY "workshop" with value "docker"
    * Redis Command: `redis-cli SET <KEY> <VALUE>`
* use docker exec to get the value of the KEY "workshop"
    * Redis Command: `redis-cli GET <KEY>`
* stop and remove the container
    * `docker stop <NAME | CONTAINERID>` to stop
    * `docker rm <NAME | CONTAINERID>` to remove

# Configure Containers

The most public Dockerimages are customizable by setting different environmet variables or mount configuration files

## Exercise #2: Start a local PostgreSQL DB
* use the public postgres:alpine image
* name the container "postgres"
* configure custom user credentials with the following ENV Variables
    * POSTGRES_USER=moveelevator
    * POSTGRES_PASSWORD=test56
    * POSTGRES_DB=workshop
* if not already happened navigate in the `01-use-public-images` folder
* populate the database by binding the scripts folder into the container
    * Bind syntax `<local-absolute-path>:<absolute-path-inside-the-container>`
    * In this case `$(pwd)/scripts/initial.sql:/docker-entrypoint-initdb.d`
    * Documentation on [DockerHub](https://hub.docker.com/_/postgres)
* Optional bind the default PostgreSQL Port 5432 to localhost:5432 and connect to the Database with your DB Client of choice

## Exercise #2.1 Select the workshops table from your Database
* use docker exec to select the DB Table on the CLI
    * Postgres Command: `psql -U moveelevator -w -d workshop -c "SELECT * FROM workshops;"`