#!/bin/bash
echo "Stopping Apache server..."
sudo systemctl stop apache2

echo "Backing up current app to /var/www/html/backup-$(date +%Y%m%d%H%M%S)..."
sudo cp -r /var/www/html/laravel-blog-api-hands-on /var/www/html/backup-$(date +%Y%m%d%H%M%S)

echo "Removing old app files..."
sudo rm -rf /var/www/html/laravel-blog-api-hands-on/*

