FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc

RUN apk add  mysql mysql-client && openrc

RUN touch /run/openrc/softlevel

COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld", "--user=root", "--bind-address=0.0.0.0"]