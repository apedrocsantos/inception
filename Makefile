up : all

all:
	docker compose -f srcs/docker-compose.yml up --build --detach

stop:
	docker compose -f srcs/docker-compose.yml stop

restart: stop start

clean:
	docker compose -f srcs/docker-compose.yml stop
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker image rm mariadb nginx wordpress
	rm -rf /home/anda-cun/data/mariadb
	rm -rf /home/anda-cun/data/wordpress

re: fclean all


.PHONY: all start stop restart clean fclean re