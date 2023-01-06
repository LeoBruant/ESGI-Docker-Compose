# Dockerfile
FROM php:8.1-fpm

# Copy
COPY ./ .
RUN mv .env-web2 .env
RUN rm .env-web1

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Update
RUN apt-get update

# Node
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -

# Installs
RUN apt-get install -y \
    libzip-dev \
    nodejs \
    zip

# Extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql zip

# Start
RUN composer i
RUN npm i
RUN npm run build
