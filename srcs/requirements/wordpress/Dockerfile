FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-fpm php-mysqli wget mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

# COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

# RUN chmod +x /usr/local/bin/wordpress.sh

# ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

EXPOSE 9000

RUN mkdir -p /run/php

CMD [ "php-fpm7.4", "-F" ]

# -F -> Force to stay in foreground and ignore daemonize option from configuration file.

# CMD ["tail",  "-f", "/dev/null"]