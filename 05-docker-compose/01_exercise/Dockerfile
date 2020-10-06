FROM composer:1 as deps

WORKDIR /app

COPY symfony-example .

RUN composer install --ignore-platform-reqs

FROM php:7.4-fpm-alpine

WORKDIR /var/www

VOLUME ["/var/www"]

COPY --from=deps /app /var/www
