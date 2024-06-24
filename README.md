# DOCKER

## Basic commands (from https://docker-curriculum.com)

docker build -t NAME . - cria imagem com nome NAME usando o Dockerfile do diretório atual
docker images - listar imagens
docker run NAME - cria contentor a partir da imagem
docker ps - listar contentores
docker container prune - delete all containers that have a status of exited
docker run omeusite --rm - apaga automaticamente depois de correr

docker run -d -p 8080:80 --name omeusite IMAGE - cria imagem com terminal detached, com forward da porta 80 para a 8080 e com o nome omeusite
docker port omeusite - lista as portas da imagem omeusite
docker stop omeusite - pára a execução da imagem

exec running container - `docker exec -it [container-id] /bin/sh`

force restart docker - `sudo systemctl restart docker.socket`

docker compose up - start application(s)

docker compose stop - stop containers

docker compose down - remove containers.

[Volumes](https://docs.docker.com/storage/volumes/) vs [Bind mounts](https://docs.docker.com/storage/bind-mounts/)

[Volumes in Docker Compose](https://docs.docker.com/compose/compose-file/07-volumes/)

## NGINX

### Dockerfile

1.  Install debian:oldstable
2.  Update and upgrade
3.  Install nginx and openssl (to create the tls certificate)
4.  Create key and certificate
5.  Run nginx


Wordpress website files will be stored in volume /home/$USER/data/wordpress

**location /**: In this location block, a try_files directive is used to check for files that match individual URI requests. Instead of returning a 404 Not Found status as a default, however, you’ll pass control to WordPress’s index.php file with the request arguments.

**location ~ \.php$**: This location block will handle PHP processing and proxy these requests to your wordpress container. Because your WordPress Docker image will be based on the php:fpm image, you will also include configuration options that are specific to the FastCGI protocol in this block. Nginx requires an independent PHP processor for PHP requests. In this case, these requests will be handled by the php-fpm processor that’s included with the php:fpm image. Additionally, this location block includes FastCGI-specific directives, variables, and options that will proxy requests to the WordPress application running in your wordpress container, set the preferred index for the parsed request URI, and parse URI requests.



### SSL TLS

[intro](https://www.youtube.com/watch?v=EnY6fSng3Ew)

[Install TLS](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)

[OpenSSL essentials](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

**Self-signed certificate** - A self-signed certificate is a certificate that is signed with its own private key. Self-signed certificates can be used to encrypt data just as well as CA-signed certificates, but your users will be displayed a warning that says that the certificate is not trusted by their computer or browser. Therefore, self-signed certificates should only be used if you do not need to prove your service’s identity to its users (e.g. non-production or non-public servers).

#### Create certificate

**openssl** - cryptography toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them.

The **-x509 option** tells req to create a self-signed certificate instead of generating a certificate signing request. The **-days 365** option specifies that the certificate will be valid for 365 days. The **-nodes option** specifies that the private key should not be encrypted with a pass phrase. 

[Settings](https://cipherlist.eu/)

[testssh.sh](https://github.com/drwetter/testssl.sh)

#### Configuring nginx to use SSL

1.  Change nginx.conf to listen on port 443 instead of 80, and using ssl.
2.  Define ssl_certificate and ssl_certificate_key.
3.  

## MARIADB

[install](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)

Two users: root and mysql

### Basic mysql commands


mariadb -u [user] -p [password]

[SQL Basic commands](https://www.w3schools.com/mysql/mysql_select.asp)

CREATE DATABASE IF NOT EXISTS [db_name];

<!-- Show current user -->
SELECT USER();

<!-- Show all users -->
SELECT User FROM mysql.user;

<!-- Create database -->
CREATE DATABASE [database_name];

<!-- Show databases -->
SHOW DATABASES;

<!-- Select database -->
USE [database];

<!-- Use database -->
USE [database];

<!-- Describe table -->
DESCRIBE [table];

<!-- Show all data from a table -->
SELECT * FROM [table];

## WORDPRESS

[install](https://wiki.alpinelinux.org/wiki/WordPress)

