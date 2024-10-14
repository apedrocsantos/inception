#! /bin/sh

if [ ! -f /etc/mysql/init.sql ]; then
    USER_PASS=$(cat /run/secrets/db_password);
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /etc/mysql/init.sql
    echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$USER_PASS';" >> /etc/mysql/init.sql
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';" >> /etc/mysql/init.sql
    echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql
    unset USER_PASS
# fi
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

fi

echo "starting mariadbd"
exec "$@"