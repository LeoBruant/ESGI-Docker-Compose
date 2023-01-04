# Dockerfile
FROM php:fpm

RUN apt-get update && apt-get install nodejs -y

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Mysql
# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# RUN composer Install \
#     php artisan key:generate \
#     php artisan migrate:fresh —seed
