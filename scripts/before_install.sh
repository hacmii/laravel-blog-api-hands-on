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

echo "Removing old project..."
sudo rm -rf "$DEPLOY_DIR"

echo "Creating deployment directory..."
sudo mkdir -p "$DEPLOY_DIR"

# Set owner to the user CodeDeploy uses (on Ubuntu, usually 'ubuntu')
# Group set to www-data so Apache can read/write
sudo chown ubuntu:www-data "$DEPLOY_DIR"

# Allow owner and group to read/write
sudo chmod 775 "$DEPLOY_DIR"

echo "BeforeInstall complete."
