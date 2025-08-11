#!/bin/bash
set -e

echo "Backing up current app..."
BACKUP_DIR="/var/www/html/backup-$(date +%Y%m%d%H%M%S)"
if [ -d "/var/www/html/laravel-blog-api-hands-on" ]; then
    sudo cp -r /var/www/html/laravel-blog-api-hands-on "$BACKUP_DIR"
fi

echo "Removing old project completely..."
sudo rm -rf /var/www/html/laravel-blog-api-hands-on

echo "Creating fresh directory..."
sudo mkdir -p /var/www/html/laravel-blog-api-hands-on
sudo chown -R ubuntu:www-data /var/www/html/laravel-blog-api-hands-on
sudo chmod -R 775 /var/www/html/laravel-blog-api-hands-on

echo "before_install.sh completed successfully."
