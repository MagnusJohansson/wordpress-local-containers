#!/bin/bash

# Set correct permissions for WordPress files and directories
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Ensure wp-content is writable
chmod 775 /var/www/html/wp-content
chmod 775 /var/www/html/wp-content/themes
chmod 775 /var/www/html/wp-content/plugins
chmod 775 /var/www/html/wp-content/uploads

# Create upgrade directory if it doesn't exist and set permissions
mkdir -p /var/www/html/wp-content/upgrade
chown www-data:www-data /var/www/html/wp-content/upgrade
chmod 775 /var/www/html/wp-content/upgrade
