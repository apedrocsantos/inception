all:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml stop
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker image rm mariadb
	docker image rm nginx
	docker image rm wordpress

re: fclean all


.PHONY: all clean fclean re