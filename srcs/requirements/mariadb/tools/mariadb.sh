#! /bin/sh

USER_PASS=$(cat /run/secrets/db_password);

    mysql_install_db

if [ ! -f /etc/mysql/init.sql ]; then
    
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /etc/mysql/init.sql
    echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$USER_PASS';" >> /etc/mysql/init.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';" >> /etc/mysql/init.sql
    echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql
fi

unset USER_PASS

exec "$@"