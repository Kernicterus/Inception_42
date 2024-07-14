#!/bin/bash

sleep 10
cd /var/www/wordpress

if ! [ -e wp-config.php ]; then
wp core download --allow-root
wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

wp core install --url=$WP_URL \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root

wp user create nledent2 nledent2@inception.com \
	--role=subscriber --user_pass=$WP_USER_PASSWORD --allow-root
chmod -R 775 wp-content
fi

php-fpm7.3 -F