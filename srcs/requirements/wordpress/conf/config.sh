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
	--path=$PATH_WORDPRESS

wp core install --url=$WP_URL \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root

wp user create user_x2 user_x2@inception.com \
	--role=subscriber --user_pass=$WP_USER_PASSWORD --allow-root

chmod -R 775 $PATH_WORDPRESS
chown -R www-data:www-data $PATH_WORDPRESS

fi


wp config set WP_REDIS_HOST redis --type=constant --allow-root --path=$PATH_WORDPRESS
wp config set WP_REDIS_PORT 6379 --type=constant --allow-root --path=$PATH_WORDPRESS
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root --path=$PATH_WORDPRESS
wp config set WP_CACHE true --type=constant --allow-root --path=$PATH_WORDPRESS
wp plugin install redis-cache --activate --allow-root --path=$PATH_WORDPRESS
wp plugin update -all --allow-root --path=$PATH_WORDPRESS
wp redis enable --allow-root --path=$PATH_WORDPRESS
chmod -R 775 $PATH_WORDPRESS
chown -R www-data:www-data $PATH_WORDPRESS

php-fpm7.4 -F