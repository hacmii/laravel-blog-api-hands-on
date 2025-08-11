#!/bin/bash

echo "Installing composer dependencies..."

cd /var/www/html/laravel-blog-api-hands-on || { echo "Directory not found"; exit 1; }

# Use full path for composer if necessary
COMPOSER_BIN=/usr/local/bin/composer

if ! command -v composer &> /dev/null; then
  echo "Composer not found, trying full path..."
  COMPOSER_BIN=/usr/local/bin/composer
fi

$COMPOSER_BIN install --no-dev --optimize-autoloader || { echo "Composer install failed"; exit 1; }

echo "Setting permissions..."

sudo chown -R ubuntu:www-data /var/www/html/laravel-blog-api-hands-on

sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/storage
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/bootstrap/cache
