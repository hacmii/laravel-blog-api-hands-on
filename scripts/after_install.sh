#!/bin/bash
echo "Installing composer dependencies..."
cd /var/www/html/laravel-blog-api-hands-on
composer install --no-dev --optimize-autoloader

echo "Setting permissions..."
sudo chown -R ubuntu:www-data /var/www/html/laravel-blog-api-hands-on
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/storage
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/bootstrap/cache
