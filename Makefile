start : all

all:
	docker-compose -f srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml stop
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker image rm mariadb
	docker image rm nginx
	docker image rm wordpress
	rm -rf /home/anda-cun/data/mariadb
	rm -rf /home/anda-cun/data/wordpress

re: fclean all


.PHONY: all clean fclean re