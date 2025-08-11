#!/bin/bash
set -e

echo "Stopping Apache server..."
sudo systemctl stop apache2

# Create timestamped backup
BACKUP_DIR="/var/www/html/backup-$(date +%Y%m%d%H%M%S)"
echo "Creating backup at $BACKUP_DIR..."
sudo cp -r /var/www/html/laravel-blog-api-hands-on "$BACKUP_DIR"

# Remove old project completely (including hidden files)
echo "Removing old project..."
sudo rm -rf /var/www/html/laravel-blog-api-hands-on

# Recreate the project folder
sudo mkdir /var/www/html/laravel-blog-api-hands-on
sudo chown www-data:www-data /var/www/html/laravel-blog-api-hands-on
sudo chmod 755 /var/www/html/laravel-blog-api-hands-on

echo "Cleanup complete. Ready for deployment."
