# Compose multiple Containers with Docker Compose

## Example #1: Running Symfony App with PHP FPM and NGINX

Running Symfony App without swoole with PHP FPM and NGINX

* compose php-fpm and nginx container in a separate network
* expose the nginx port to localhost
* configure a composer container to install dependencies
* overwrite the default nginx configuration

## Example #2: Running Fastify Server with NodeJS and a PostgreSQL DB

Running Fastify Server with a connected PostgreSQL DB

* compose fastify server and postgres container in a separate network
* expose the fastify port to localhost
* expose the postgres port to localhost
* configure a NPM container to install dependencies
