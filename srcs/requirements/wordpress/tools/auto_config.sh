#!/bin/bash

sleep 10

if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    wp config create --dbname=wordpress --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD --dbhost=mariadb \
    --allow-root --force
    wp core install --url="rgodtsch.42.fr" --title="Inception" \
    --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS \
    --admin_email=rgodtsch@42lausanne.ch --allow-root
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASS --allow-root
    wp config shuffle-salts --allow-root
	# wp post create /tmp/article.txt --post_title="Inception" --post-status=publish --post_author="chatgepeto" --allow-root
	# wp theme install teluro --activate --allow-root
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.3 -F -R
else
    echo "Wordpress's installation failed"
fi
