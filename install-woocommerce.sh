#!/bin/bash

# Wait for WordPress to be fully installed
until $(wp core is-installed --allow-root); do
    echo "Waiting for WordPress to be installed..."
    sleep 5
done

echo "WordPress is installed. Proceeding with WooCommerce setup."

# Check if WooCommerce is already installed and active
if wp plugin is-installed woocommerce --allow-root && wp plugin is-active woocommerce --allow-root; then
    echo "WooCommerce is already installed and active."
else
    echo "Installing and activating WooCommerce..."
    wp plugin install woocommerce --activate --allow-root
    echo "WooCommerce installation complete."
fi

# Create a flag file to indicate script has run
touch /var/www/html/.woocommerce_script_run