#! /bin/sh

echo 'rc_provide="loopback net"' >> /etc/rc.conf

apk add wget mysql mysql-client php82-mysqli

mkdir -p /var/www/html

cd /var/www/html
wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

mv wordpress/* .

rm latest.tar.gz wordpress

/usr/bin/mysql_install_db --user=mysql
rc-service mariadb setup
rc-service mariadb start
rc-update add mariadb default
/usr/bin/mysqladmin -u root password 'password'

mysql -u root -e "

CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';
FLUSH PRIVILEGES;
EXIT

"

exec "$@"