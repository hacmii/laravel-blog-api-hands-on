#!/bin/bash
echo "Stopping Apache server..."
sudo systemctl stop apache2

echo "Creating backup..."
BACKUP_DIR="/var/www/html/backup-$(date +%Y%m%d%H%M%S)"
sudo cp -r /var/www/html/laravel-blog-api-hands-on "$BACKUP_DIR"

echo "Removing old files (including hidden ones)..."
sudo rm -rf /var/www/html/laravel-blog-api-hands-on/* /var/www/html/laravel-blog-api-hands-on/.* 2>/dev/null || true

