FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y && apt install openssl -y

ARG USERNAME

ENV USERNAME=${USERNAME}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/ST=Lx/L=Lx/O=42/OU=42/CN=$USERNAME.42.fr/UID=$USERNAME"

COPY conf/default /etc/nginx/sites-available/

CMD [ "nginx", "-g", "daemon off;" ]
