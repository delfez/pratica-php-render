FROM php:8.3-apache

# Set working directory
WORKDIR /var/www/html

# Copy your application files into the container
COPY . .

# If your app requires Composer dependencies, uncomment the next lines:
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# RUN composer install --no-dev --optimize-autoloader

# Render assigns a dynamic PORT (defaulting to 10000). 
# This command updates Apache configuration to listen on $PORT at runtime, then starts Apache.
CMD ["sh", "-c", "sed -i \"s/80/$PORT/g\" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf && apache2-foreground"]