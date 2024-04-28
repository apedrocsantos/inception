#! /bin/sh

if [ -z $(find /var/lib/mysql -maxdepth 0 -empty) ]
then
    echo "DB already exists"

else
    echo "MARIADB SETUP"
    rc-service mariadb setup
    rc-service mariadb start
    mysql_secure_installation <<EOF

y
secret
secret
y
y
y
y
EOF

    rc-service mariadb restart

    rc-update add mariadb default
fi

exec "$@"