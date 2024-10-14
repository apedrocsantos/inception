#! /bin/sh


echo "installing mysql"
mariadb-install-db

if [ ! -f /etc/mysql/init.sql ]; then
    USER_PASS=$(cat /run/secrets/db_password);
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /etc/mysql/init.sql
    echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$USER_PASS';" >> /etc/mysql/init.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';" >> /etc/mysql/init.sql
    echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql
    unset USER_PASS
fi
service mariadb start
mariadb-secure-installation <<EOF

n
n
y
y
y
y
EOF

service mariadb stop

exec "$@"