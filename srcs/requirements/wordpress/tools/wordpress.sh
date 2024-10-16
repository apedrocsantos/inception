#! /bin/sh

until mariadb-admin ping -h mariadb --silent; do
  echo "Waiting for MariaDB to be healthy..."
  sleep 4
done

if [ -f "/var/www/html/wp-config.php" ]; then

  echo "Wordpress already configured."

else

  echo "configuring wordpress"
  mkdir -p /var/www/html
  cd /var/www/html

  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar

  echo "wp downloading core"
  ./wp-cli.phar core download --allow-root
  echo "wp creating config file"
  ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$(cat $MYSQL_PASSWORD_FILE) --dbhost=mariadb --allow-root
  echo "wp installing core"
  ./wp-cli.phar core install --url=https://$HOST --title=inception --admin_user=$WORDPRESS_ADMIN --admin_password=$(cat $WORDPRESS_ADMIN_PASSWORD_FILE) --admin_email=admin@admin.com --allow-root

fi

echo "starting php-fpm"
exec "$@"