#!/bin/bash

service php7.4-fpm start
service nginx start
service mariadb start
mysql -uroot -proot123 < configure-mariadb.sql


./vendor/bin/phinx migrate

./bin/cli env:create --name production --type MariaDB --host localhost --username root --password root123 --databasename fusionsuite_db --current
./bin/cli install

tail -f /var/log/nginx/error.log