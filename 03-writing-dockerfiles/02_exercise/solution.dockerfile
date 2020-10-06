FROM php:7.4-cli-alpine

RUN apk add autoconf make g++ \
    && pecl install swoole \
    && apk del make autoconf \
    && docker-php-ext-enable swoole

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

COPY ./symfony-example .

RUN composer install

EXPOSE 9501

ENTRYPOINT ["bin/console", "swoole:server:run"]