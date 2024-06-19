#! /bin/sh

mkdir /run/php

mkdir -p /var/www/html

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz wordpress

exec "$@"