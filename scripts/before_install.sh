#!/bin/bash
set -e

echo "Removing old application files (including hidden files)..."
sudo rm -rf /var/www/html/laravel-blog-api-hands-on/* \
             /var/www/html/laravel-blog-api-hands-on/.[!.]* \
             /var/www/html/laravel-blog-api-hands-on/..?*

echo "Directory cleaned."
