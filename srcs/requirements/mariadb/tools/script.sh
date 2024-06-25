#!/bin/bash

# print command
set -x

touch file
chmod 777 file

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "GRANT ALL ON *.* TO '$SQL_ROOT_USER'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> file
echo "GRANT ALL ON wordpress.* TO '$SQL_USER'@'%';"  >> file
echo "FLUSH PRIVILEGES;" >> file

cat file

mysqld --user=mysql --verbose --bootstrap < file

# Vérification des bases de données et des utilisateurs
echo "SHOW DATABASES;" | mysql -u root -p"$SQL_ROOT_PASSWORD"
echo "SHOW GRANTS FOR '$SQL_USER'@'%';" | mysql -u root -p"$SQL_ROOT_PASSWORD"

rm file

exec mysqld