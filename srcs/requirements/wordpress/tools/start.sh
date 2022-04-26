#!/user/bin/env bash

sed -i -e "s/\${DB_NAME}/${DB_DATABASE}/g" /var/www/html/wp-config.php
sed -i -e "s/\${DB_USER}/${DB_USER}/g" /var/www/html/wp-config.php
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/html/wp-config.php
sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /var/www/html/wp-config.php

#Install Command-Line Interface for WordPress
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x ./wp-cli.phar
cp ./wp-cli.phar /usr/local/bin/wp

sleep 5
#Install WordPress database, so that site is ready from the beginning without needing to manually install it
wp core install --allow-root --url=dkarisa.42.fr --title="Inception Time!" --admin_user=dkarisa --admin_password=${WP_ADMIN_PASSWORD} --admin_email=dkraisa@wp.com --path=/var/www/html
wp user create Jhonny jhon@mail.com --allow-root --role=author --user_pass=${WP_USER_PASSWORD} --path=/var/www/html

mkdir -p /run/php
touch /run/php/php7-fpm.pid
exec php-fpm7.3 --nodaemonize
