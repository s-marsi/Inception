DC         = docker compose -f srcs/docker-compose.yaml
DATA_DIR   = /home/smarsi/data

# -----------------------------------------------------------------------------
# Docker Compose lifecycle commands
# -----------------------------------------------------------------------------

all: build up

build:
	sudo mkdir -p /home/smarsi/data/mariadb/ /home/smarsi/data/wordpress/
	$(DC) build

no-cache:
	sudo mkdir -p /home/smarsi/data/mariadb/ /home/smarsi/data/wordpress/
	$(DC) build --no-cache
	$(DC) up -d

up:
	$(DC) up -d

down:
	$(DC) down

down-v:
	$(DC) down -v

start:
	$(DC) start

stop:
	$(DC) stop

restart:
	$(DC) restart

ps:
	$(DC) ps

logs:
	$(DC) logs

# -----------------------------------------------------------------------------
# Docker cleanup commands
# -----------------------------------------------------------------------------

clean:
	sudo rm -rf $(DATA_DIR)/*
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true

fclean: clean
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q) 2 > /dev/null


.PHONY: build no-cache up down down-v start stop restart ps logs clean fclean
