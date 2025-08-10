#!/bin/bash
echo "Checking if Apache is running..."
systemctl is-active --quiet apache2
if [ $? -ne 0 ]; then
    echo "Apache is not running"
    exit 1
fi
echo "Deployment validated successfully."
