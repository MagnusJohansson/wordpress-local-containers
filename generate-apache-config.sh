#!/bin/bash

cat << EOF > /etc/apache2/conf-available/wordpress-custom.conf
ServerName ${SERVER_NAME}

<Directory /var/www/html/wp-content/uploads/woocommerce_uploads>
    Options FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
EOF