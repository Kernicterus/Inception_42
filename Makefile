DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml


all: build

build:
	mkdir -p /home/nledent/data/wordpress
	mkdir -p /home/nledent/data/mariadb
	$(DOCKER_COMPOSE) up --build -d 

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	docker image prune -a

delete_wp_config:
	sudo rm -rf /home/nledent/data/wordpress/wp-config.php

delete_vol:
	sudo rm -rf /home/nledent/data/mariadb
	sudo rm -rf /home/nledent/data/wordpress

.PHONY: all build down clean delete_vol delete_wp_config