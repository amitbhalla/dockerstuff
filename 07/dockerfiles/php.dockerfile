FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

# Added for deployment
COPY src .
# End

RUN docker-php-ext-install pdo pdo_mysql

# Added for deployment
RUN chown -R www-data:www-data /var/www/html
# End

