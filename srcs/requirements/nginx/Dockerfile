FROM alpine:3.18

RUN apk update && \
    apk add --upgrade apk-tools && \
    apk upgrade --available && \
    apk add openrc

RUN apk add nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN nginx -s reload
# start server
# RUN rc-service nginx start

# reload server
# RUN rc-service nginx reload

#start automatically on system boot
RUN rc-update add nginx default

# EXPOSE 8080

# CMD [ "nginx", "-g", "daemon off;" ]
