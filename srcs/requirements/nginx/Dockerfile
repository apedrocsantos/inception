FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc

RUN apk add nginx && apk add openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=LIS/L=Lisboa/O=42/OU=42/CN=login.42.fr/UID=login"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# start server
# RUN rc-service nginx start

# reload server
# RUN rc-service nginx reload

#start automatically on system boot
RUN rc-update add nginx default

CMD [ "nginx", "-g", "daemon off;" ]
