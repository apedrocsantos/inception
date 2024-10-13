# RUN INSTRUCTIONS

For MacOS, replace `/home` with `/Users`.

Important - don't run as su.

1.  Replace the .env USERNAME variable with your username.

2.  Create `/secrets´folder with the files: db_password.txt, db_root_password.txt and wp_admin_password.txt.

3.  first time - `sudo make` then go to `https://<your username>.42.fr`

stop containers - `sudo make stop`

delete containers (also stops) - `sudo make down`

restart containers (re-creates if necessary) - `sudo make up`

delete containers and volumes - `sudo make clean`

full clean (also removes /data/) - `sudo make fclean`

# DOCKER

## [Install Docker Desktop](https://docs.docker.com/desktop/install/linux/ubuntu/)

### Basic commands (from https://docker-curriculum.com)

docker build -t [NAME] . - create image with name NAME using the Dockerfile in the current directory

docker images - list images

docker run [NAME] - create container from image

docker ps - list running containers

docker ps -a - list all containers

docker container prune - delete all containers that have a status of exited

docker run [container] --rm - automatically deletes container after stopping

docker run -d -p 8080:80 --name [container] IMAGE - creates container with terminal detached, forwarding port 80 to port 8080 on the  host, and with the name [container]

docker port [container] - list [container] ports

docker stop [container] - stops [container]

execute running container - `docker exec -it [container-id] /bin/sh`

force restart docker - `sudo systemctl restart docker.socket docker.service`

docker compose docker-compose.yml up - start container(s).

docker compose docker-compose.yml stop - stop containers.

docker compose docker-compose.yml down - stop and remove containers.

[Volumes](https://docs.docker.com/storage/volumes/) vs [Bind mounts](https://docs.docker.com/storage/bind-mounts/)

[Volumes in Docker Compose](https://docs.docker.com/compose/compose-file/07-volumes/)

## Dockerfile

## Docker-compose

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file.

### The Compose Application Model

1.  Computing components of an application are defined as **services**. A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.

2.  Services communicate with each other through **networks**. In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together.

3.  Services store and share persistent data into **volumes**. The Specification describes such a persistent data as a high-level filesystem mount with global options.

4.  A **secret** is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.

[Services top-level elements] (https://docs.docker.com/reference/compose-file/services/)

### Volumes

Docker external named volumes can be used across the Docker installation.

`docker volume ls` - list volumes

`docker volume inspect <volume_name>` - inspect specific volume

### Secrets

The secrets attribute grants access to sensitive data defined by the secrets top-level element on a per-service basis. Services can be granted access to multiple secrets.



# NGINX

## Dockerfile

1.  Install debian:oldstable
2.  Update and upgrade
3.  Install nginx and openssl (to create the tls certificate)
4.  Create key and certificate
5.  Run nginx


## SSL TLS

[intro](https://www.youtube.com/watch?v=EnY6fSng3Ew)

[Install TLS](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)

[OpenSSL essentials](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

**Self-signed certificate** - A self-signed certificate is a certificate that is signed with its own private key. Self-signed certificates can be used to encrypt data just as well as CA-signed certificates, but your users will be displayed a warning that says that the certificate is not trusted by their computer or browser. Therefore, self-signed certificates should only be used if you do not need to prove your service’s identity to its users (e.g. non-production or non-public servers).

### Create certificate

**openssl** - cryptography toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them.

The **-x509 option** tells req to create a self-signed certificate instead of generating a certificate signing request. The **-days 365** option specifies that the certificate will be valid for 365 days. The **-nodes option** specifies that the private key should not be encrypted with a pass phrase. 

[Settings](https://cipherlist.eu/)

[testssh.sh](https://github.com/drwetter/testssl.sh)

### Configuring nginx to use SSL

1.  Change nginx.conf to listen on port 443 instead of 80, and using ssl.
2.  Define ssl_certificate and ssl_certificate_key.
3.  

# MARIADB

## Dockerfile

???????????????????

[install](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)

Two users: root and mysql

## Basic mysql commands


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

# WORDPRESS

## Dockerfile

???????????????????

Wordpress website files will be stored in volume /home/$USER/data/wordpress

**location /**: In this location block, a try_files directive is used to check for files that match individual URI requests. Instead of returning a 404 Not Found status as a default, however, you’ll pass control to WordPress’s index.php file with the request arguments.

**location ~ \.php$**: This location block will handle PHP processing and proxy these requests to your wordpress container. Because your WordPress Docker image will be based on the php:fpm image, you will also include configuration options that are specific to the FastCGI protocol in this block. Nginx requires an independent PHP processor for PHP requests. In this case, these requests will be handled by the php-fpm processor that’s included with the php:fpm image. Additionally, this location block includes FastCGI-specific directives, variables, and options that will proxy requests to the WordPress application running in your wordpress container, set the preferred index for the parsed request URI, and parse URI requests.
