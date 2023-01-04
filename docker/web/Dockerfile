# Dockerfile
FROM php:8.1-fpm

# Env
ENV COMPOSER_ALLOW_SUPERUSER 1

# Copy all
COPY ./ .

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Update
RUN apt-get update

# Extensions
RUN apt-get install -y \
    libzip-dev \
    zip

RUN docker-php-ext-install mysqli pdo pdo_mysql zip

# Node
RUN apt-get install nodejs -y

# Start
RUN composer install
RUN php artisan key:generate

# Build
# CMD npm run build
