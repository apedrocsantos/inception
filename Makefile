all:
	mkdir -p /Users/$$USER/data/mariadb /Users/$$USER/data/wordpress
	docker compose -f srcs/docker-compose.yml up --build

up:
	docker compose -f srcs/docker-compose.yml up --detach

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml darown

restart: stop up

clean:
	docker compose -f srcs/docker-compose.yml stop
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker image rm mariadb nginx wordpress
	rm -rf /Users/$$USER/data/mariadb
	rm -rf /Users/$$USER/data/wordpress

re: fclean all

reset:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

.PHONY: all start stop down restart clean fclean re reset