FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

# RUN mkdir /run/mysqld

# COPY conf/init.sql .

# COPY tools/mariadb.sh /usr/local/bin/

# RUN chmod +x /usr/local/bin/mariadb.sh

# ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]

# CMD ["tail",  "-f", "/dev/null"]