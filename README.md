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
