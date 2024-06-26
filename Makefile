DOCKER = docker compose -f srcs/docker-compose.yml


all:
	clear
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	$(DOCKER) up -d --build

clean:
	clear
	$(DOCKER) down
	docker image prune -a

fclean: clean
	docker volume rm srcs_wordpress --force
	docker volume rm srcs_mariadb --force
	docker system prune -a --volumes
	rm -rf ~/data/wordpress
	rm -rf ~/data/mariadb

re : fclean all

list:
	clear
	docker ps -a
	docker images ls
	docker volume ls
	docker network ls

.PHONY: all re fclean clean list