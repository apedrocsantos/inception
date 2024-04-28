#! /bin/sh

echo 'rc_provide="loopback net"' >> /etc/rc.conf

rc-service lighttpd start
rc-update add lighttpd default

apk add wget mysql mysql-client php82-mysqli

rc-service lighttpd restart

mkdir -p /usr/share/webapps/

cd /usr/share/webapps/
wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz
rm latest.tar.gz

chown -R lighttpd /usr/share/webapps/

ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

/usr/bin/mysql_install_db --user=mysql
rc-service mariadb setup
rc-service mariadb start
rc-update add mariadb default
# /usr/bin/mysqladmin -u root password 'password'

mysql -u root -e "

CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';
FLUSH PRIVILEGES;
EXIT

"

# mv /usr/share/wp-config.php /usr/share/webapps/wordpress

exec "$@"