DOCKER = docker compose -f srcs/docker-compose.yml


all:
	clear
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	$(DOCKER) up -d --build

clean:
	clear
	docker image prune -a
	$(DOCKER) down

fclean: clean
	docker system prune -a --volumes

re : fclean all

list:
	clear
	docker ps -a
	docker images ls
	docker volume ls
	docker network ls

.PHONY: all re fclean clean list