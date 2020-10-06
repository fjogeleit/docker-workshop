# Tweak Dockerfiles with Multi Stage Builds
Dockerimages should be as small as possible with a minimum of installed dependencies

## Exercise #1: Optimize the size of our Symfony Dockerfile
Split our 1 build step `Dockerfile` to improve security and size

* copy the Dockerfile from `03-writing-dockerfiles/02_exercise` into `04-multi-stage-builds/01_exercise`
* preappend a build step with `composer:1` as base image and set a alias `deps`
```docker
FROM composer:1 AS deps
```
* set the `WORKDIR` to `/app`
* move the `COPY` instruction into this first build step
* install dependencies, ignore platform requirements with `--ignore-platform-reqs`
```docker
RUN composer install --ignore-platform-reqs
```
* `COPY` the application code including the installed vendor from the `deps` build step
```docker
COPY --from=deps /app .
```
* `EXPOSE` the default `swoole` port `9501`
* use `bin/console swoole:server:run` as `ENTRYPOINT` for the Dockerfile
* build the Dockerfile with tag `symfony-example-new`
* Run the `symfony-example` image and bind `9501` to localhost
* Autoremove after container exit
* open http://localhost:9501
* (optional) compare the size of `symfony-example-new` and `symfony-exmaple` with `docker ps -s`

## Exercise #2: Optimize the size, securizty and runtime of our Vue Frontend
Split the NodeJS related tasks into its own build step and remove NodeJS completly from the resulting Dockerimage

* copy the Dockerfile from `03-writing-dockerfiles/03_exercise` into `04-multi-stage-builds/02_exercise`
* preappend a build step with `node:14` as base image and set a alias `builder`
```docker
FROM node:14 AS builder
```
* set the `WORKDIR` to `/app`
* move the `COPY` instruction into this first build step
* `RUN` the `npm install` and `npm run build` command in this first build step
* `COPY` the resulted `dist` folder from the first build step into the `/usr/share/nginx/html` folder of the second step
```docker
COPY --from=builder /app/dist /usr/share/nginx/html
```
* `EXPOSE` port `80`
* build the Dockerfile with tag `vue-example-new`
* Run the `vue-example-new` image and bind `80` to localhost
* Autoremove after container exit
* open http://localhost:80
* (optional) compare the size of `vue-example-new` and `vue-exmaple` with `docker ps -s`