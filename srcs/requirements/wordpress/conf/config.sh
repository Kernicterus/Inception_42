#!/bin/bash

sleep 10
cd /var/www/wordpress

if ! [ -e wp-config.php ]; then
#wp core download --allow-root
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
fi


wp config set REDIS_HOST 172.18.0.7 --type=variable --allow-root
wp config set REDIS_PORT 6379 --type=variable --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp config set WP_CACHE true --type=constant --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update -all --allow-root
wp redis enable --allow-root
chmod -R 775 wp-content

php-fpm7.3 -F