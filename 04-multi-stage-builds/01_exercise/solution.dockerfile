FROM composer:1 as deps

WORKDIR /app

COPY symfony-example .

RUN composer install --ignore-platform-reqs

FROM php:7.4-cli-alpine

RUN apk add autoconf make g++ \
    && pecl install swoole \
    && apk del make autoconf \
    && docker-php-ext-enable swoole

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

WORKDIR /var/www

COPY --from=deps /app .

EXPOSE 9501

ENTRYPOINT ["bin/console", "swoole:server:run"]