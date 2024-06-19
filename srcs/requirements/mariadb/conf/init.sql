CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$USER_PASS';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';
FLUSH PRIVILEGES;