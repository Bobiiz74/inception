DOCKER = docker compose -f srcs/docker-compose.yml
DATA_FOLDER = /home/robin/data

all:
	clear
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
	docker network ls
	docker volume ls

.PHONY: all re fclean clean list