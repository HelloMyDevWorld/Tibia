FROM php:7.2-apache

RUN a2enmod rewrite

RUN [ "docker-php-ext-install", "pdo", "pdo_mysql", "mysqli", "mbstring" ]

COPY html /var/www/html

RUN chmod -R 777 /var/www/html/engine/
RUN chmod -R 777 /var/www/html/engine/cache/
RUN chmod -R 777 /var/www/html/engine/function/
RUN chmod -R 777 /var/www/html/engine/function/cache.php

VOLUME [ "/srv" ]