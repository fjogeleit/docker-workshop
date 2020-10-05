# Dockerize common CD Tools

A common task in CD/CI Pipeline is the execution of Tests and CodeStyle checks. This require a hugh amount of different tools, versions and extension on the local machine for many different projects. To reduce this dependencies its possible to execute this tasks into versioned Docker Containers. By exclude this work from the local machine to Docker Container, it also reduce the amount of local tools during local development.

## Exercise #1: Install PHP Dependencies
Install the dependencies defined in the composer.json of the example app using docker

* use the official `composer` image
* mount the local app directory to /app inside of the composer container
    * mount rule `$(pwd)/app:/app`
* autoremove the container after exit
* execute the `install` command to install dependencies
* Documentation on [DockerHub](https://hub.docker.com/_/composer)

## Exercise #2: Run PHPUnit Tests
Run PHPUnit Tests using the official PHPUnit Docker Image

* use the official `phpunit/phpunit` image
* mount the local app directory to /app inside of the phpunit container
    * mount rule `$(pwd)/app:/app`
* autoremove the container after exit
* execute PHPUnit on the `test` folder
* Documentation on [DockerHub](https://hub.docker.com/r/phpunit/phpunit)

## Exercise #3: Run PHPCodeSniffer
Run PHPCodeSniffer using the cytopia/phpcs Docker Image

* use `cytopia/phpcs` image
* mount the local app directory to /app inside of the phpunit container
    * mount rule `$(pwd)/app:/data`
* autoremove the container after exit
* execute PHPCS on the `src` folder with the progress `-p` option
* Documentation on [DockerHub](https://hub.docker.com/r/cytopia/phpcs)

## Exercise #4: Install JavaScript dependencies with NPM using docker
Install JavaScript dependencies using the bitname/node docker image

* use `bitnami/node` image
* mount the local server directory to /app inside of the node container
    * mount rule `$(pwd)/server:/app`
* autoremove the container after exit
* execute `npm install` to install all required dependencies
* Documentation on [DockerHub](https://hub.docker.com/r/bitnami/node/)

## Exercise #5: Run the Server on localhost using docker
Run the example server in docker and bind it on localhost

* use `bitnami/node` image
* mount the local server directory to /app inside of the node container
    * mount rule `$(pwd)/server:/app`
* autoremove the container after exit
* (otional) define the server port using the PORT ENV variable - default is 3000
* bind the container service port to a local port
    * port schema `<local-port>:<container-port>`
* execute `npm start` to start the server
* surfe `http://localhost:<local-port>/is-odd/5`