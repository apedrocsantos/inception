#! /bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

USER_PASS=$(cat /run/secrets/db_password);

exec mysqld_safe --no-defaults --user=root --datadir=/var/lib/mysql

mariadb < mysql.db

unset USER_PASS