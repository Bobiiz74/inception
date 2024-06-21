#!/bin/bash

# Attente pour que MariaDB soit prêt
until mysql -h mariadb -u $SQL_USER -p$SQL_PASSWORD -e "SHOW DATABASES;" 2>/dev/null; do
  echo "Waiting for MariaDB to be ready..."
  sleep 5
done

if ! wp core is-installed --allow-root ; then
    wp core download --allow-root --force
    wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root --force
    wp core install --url="$DOMAIN_NAME" --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_EMAIL --allow-root
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASS --allow-root
    wp config shuffle-salts --allow-root
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root ; then
    echo "Wordpress is installed and running"
    php-fpm7.3 -F -R
else
    echo "Wordpress's installation failed"
fi
