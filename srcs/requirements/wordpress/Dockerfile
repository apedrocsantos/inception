FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc && apk add udev-init-scripts-openrc

RUN apk add php82 php82-fpm && openrc

RUN touch /run/openrc/softlevel

# COPY conf/wp-config.php /usr/share

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

CMD ["/usr/sbin/php-fpm82", "-F"]

# CMD ["/bin/sh"] 