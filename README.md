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

## NGINX

### SSL TLS

[intro](https://www.youtube.com/watch?v=EnY6fSng3Ew)

[Install TLS](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)

[Settings](https://cipherlist.eu/)

docker exec -it [container name] /bin/sh

[testssh.sh](https://github.com/drwetter/testssl.sh)

## MARIADB

[install](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)

## WORDPRESS

[install](https://wiki.alpinelinux.org/wiki/WordPress)
