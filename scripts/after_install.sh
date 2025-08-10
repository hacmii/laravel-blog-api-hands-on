#!/bin/bash
echo "Copying new files and setting permissions..."
sudo chown -R ubuntu:www-data /var/www/html/laravel-blog-api-hands-on
cd /var/www/html/laravel-blog-api-hands-on
echo "Installing composer dependencies..."
composer install --no-dev --optimize-autoloader
echo "Running migrations..."
php artisan migrate --force
