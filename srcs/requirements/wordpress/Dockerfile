FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-fpm php-mysqli curl mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

RUN mkdir -p /run/php

# -F -> Force to stay in foreground.
CMD [ "php-fpm7.4", "-F" ]