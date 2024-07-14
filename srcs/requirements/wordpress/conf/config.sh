#!/bin/bash

sleep 10
php-fpm7.3 -F

wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

wp core install --title=Inception \
	--admin_user=nledent \
	--admin_email=nledent@inception.com

wp user create nledent2 nledent2@inception.com
