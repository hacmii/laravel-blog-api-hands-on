#!/bin/bash
set -e

echo "Stopping Apache..."
sudo systemctl stop apache2

DEPLOY_DIR="/var/www/html/laravel-blog-api-hands-on"
BACKUP_DIR="/var/www/html/backup-$(date +%Y%m%d%H%M%S)"

echo "Backing up existing project (if exists)..."
if [ -d "$DEPLOY_DIR" ]; then
    sudo cp -r "$DEPLOY_DIR" "$BACKUP_DIR"
fi

echo "Removing old project completely..."
sudo rm -rf "$DEPLOY_DIR"

echo "Creating clean deployment directory..."
sudo mkdir -p "$DEPLOY_DIR"
sudo chown ubuntu:www-data "$DEPLOY_DIR"
sudo chmod 775 "$DEPLOY_DIR"

echo "BeforeInstall complete."
