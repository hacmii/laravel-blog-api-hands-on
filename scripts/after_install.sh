#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Installing composer dependencies..."

cd /var/www/html/laravel-blog-api-hands-on || { 
    echo "Directory not found"; 
    exit 1; 
}

# Detect composer binary
if command -v composer &> /dev/null; then
    COMPOSER_BIN=$(command -v composer)
else
    COMPOSER_BIN="/usr/local/bin/composer"
    if [ ! -f "$COMPOSER_BIN" ]; then
        echo "Composer not found!"
        exit 1
    fi
fi

"$COMPOSER_BIN" install --no-dev --optimize-autoloader || { 
    echo "Composer install failed"; 
    exit 1; 
}

echo "Setting permissions..."

sudo chown -R ubuntu:www-data /var/www/html/laravel-blog-api-hands-on
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/storage
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on/bootstrap/cache

echo "after_install.sh completed successfully."

