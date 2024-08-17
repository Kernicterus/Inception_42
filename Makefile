DOCKER_COMPOSE = sudo docker compose -f srcs/docker-compose.yml


all: build

build:
	mkdir -p /home/$(USER)/inception_data/wordpress
	mkdir -p /home/$(USER)/inception_data/mariadb
	sudo chmod +x generate_compose.sh
	bash generate_compose.sh
	$(DOCKER_COMPOSE) up --build -d 

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	sudo docker system prune -a

delete_wp_config:
	rm -rf /home/$(USER)/inception_data/wordpress/wp-config.php

delete_vol:
	rm -rf /home/$(USER)/inception_data/mariadb
	rm -rf /home/$(USER)/inception_data/wordpress

.PHONY: all build down clean delete_vol delete_wp_config