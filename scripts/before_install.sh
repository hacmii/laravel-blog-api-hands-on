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

# Completely remove old app directory
echo "Removing old application directory..."
sudo rm -rf "$APP_DIR"

# Recreate empty directory
sudo mkdir -p "$APP_DIR"
sudo chown -R ubuntu:www-data "$APP_DIR"

echo "Backup complete and old app removed."
