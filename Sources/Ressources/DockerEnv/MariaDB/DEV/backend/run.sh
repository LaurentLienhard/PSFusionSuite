#!/bin/bash

service php8.1-fpm start
service nginx start
service mariadb start
mysql -uroot -proot123 <configure-mariadb.sql

./vendor/bin/phinx migrate

./bin/cli env:create --name production --type MariaDB --host localhost --username fusionsuite_user --password StrongDBPassword --databasename fusionsuite_db --current
./bin/cli install

tail -f /var/log/nginx/error.log
