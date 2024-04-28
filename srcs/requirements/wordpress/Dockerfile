FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc

RUN apk add lighttpd php82 fcgi php82-cgi && openrc

RUN touch /run/openrc/softlevel

COPY conf /etc/lighttpd

COPY conf/wp-config.php /usr/share

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh

# ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]