#!/bin/bash
echo "Stopping Apache server..."
sudo systemctl stop apache2
echo "Removing old files..."
rm -rf /var/www/html/laravel-blog-api-hands-on/*
