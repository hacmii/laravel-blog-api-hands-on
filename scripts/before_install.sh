#!/bin/bash
set -e

APP_DIR="/var/www/html/laravel-blog-api-hands-on"
BACKUP_DIR="/var/www/html/backup_$(date +"%Y%m%d_%H%M%S")"

# Backup existing folder
if [ -d "$APP_DIR" ]; then
    echo "Backing up current application to $BACKUP_DIR"
    sudo mkdir -p "$BACKUP_DIR"
    sudo cp -R "$APP_DIR"/* "$BACKUP_DIR"/
fi

# Clean up the application directory except .env and storage/
echo "Cleaning up application directory..."
sudo find "$APP_DIR" -mindepth 1 -maxdepth 1 ! -name '.env' ! -name 'storage' -exec rm -rf {} +

# Fix ownership so CodeDeploy can overwrite files
sudo chown -R ubuntu:www-data "$APP_DIR"

echo "Backup and cleanup complete."
