# Writing our first Dockerfiles

To dockerize Applications it's often needed and recommended to create your own Dockerfiles with all required dependencies and configurations

## Exercise #1: Create Hello World Dockerfile
Surving static HTML over docker with a custom `Dockerfile`

* create a Dockerfile inside the `01_exercise` folder
* use `nginx:alpine` as base image
* `COPY` the content of `hello_world` into the container under `/usr/share/nginx/html`
* `EXPOSE` the port `80`
* Build the `Dockerfile` within the `01_exercise` folder with a build context relative to this folder `.` and a tag of `hello-world`
* Run the `hello-world` image and bind the `80` port to localhost
* Autoremove after container exit
* open http://localhost

## Exercise #2: Dockerize a Symfony App
Surving a fresh SymfonyFlex project with a custom `Dockerfile`

* create a Dockerfile inside the `02_exercise` folder
* use `php:7.4-cli-alpine` base image
* install and enable additional packages and extension to run the application with `swoole`

```docker
RUN apk add autoconf make g++ \
    && pecl install swoole \
    && apk del make autoconf \
    && docker-php-ext-enable swoole
```
* use the provided PHP Production configuration within the container `$PHP_INI_DIR` by ranming `php.ini-production` to `php.ini`
```docker
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
```
* install `composer` inside of the Dockerfile with
```docker
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```
* set the `WORKDIR` to `/var/www`
* `COPY` the `symfomy-example` folder into the container
* install dependencies by `RUN`ning `composer install`
* `EXPOSE` the default `swoole` port `9501`
* use `bin/console swoole:server:run` as `ENTRYPOINT` for the Dockerfile
* build the Dockerfile with tag `symfony-example`
* Run the `symfony-example` image and bind `9501` to localhost
* Autoremove after container exit
* open http://localhost:9501

## Exercise #2: Dockerize a Vue Frontend
Surving a Vue3 Frontend projection with a custom `Dockerfile`

* create a Dockerfile inside the `03_exercise` folder
* use `nginx` as base image
* install NodeJS v.14 to install depencendies and build the Vue3 App
```docker
RUN apt-get update && apt-get install -y apt-utils rsync make g++ \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt install -y nodejs
```
* set the `WORKDIR` to `/var/www/app`
* `COPY` the `vue-example` folder into the container `WORKDIR`
* `RUN` the `npm install` and `npm run build`
* `RUN mv /var/www/app/dist/* /usr/share/nginx/html` to move the build result to the provided folder for NGINX
* `EXPOSE` port `80`
* build the Dockerfile with tag `vue-example`
* Run the `vue-example` image and bind `80` to localhost
* Autoremove after container exit
* open http://localhost:80