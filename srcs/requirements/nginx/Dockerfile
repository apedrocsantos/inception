FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc

RUN apk add nginx && apk add openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/ST=Lx/L=Lx/O=42/OU=42/CN=anda-cun.42.fr/UID=anda-cun"

COPY conf/self_signed.conf /etc/nginx/snippets/self-signed.conf

COPY conf/ssl_params.conf /etc/nginx/snippets/ssl_params.conf

RUN openrc

RUN touch /run/openrc/softlevel

RUN rc-update add nginx default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
