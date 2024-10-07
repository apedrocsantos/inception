#! /bin/sh

mkdir -p /var/www/html
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$(cat $MYSQL_PASSWORD_FILE) --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=https://$USER.42.fr --title=inception --admin_user=$WORDPRESS_ADMIN --admin_password=$(cat $WORDPRESS_ADMIN_PASSWORD_FILE) --admin_email=admin@admin.com --allow-root

exec "$@"