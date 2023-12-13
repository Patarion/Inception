
all : up

up : 
	@docker-compose -f ./src/docker-compose.yml up -d

down : 
	@docker-compose -f ./src/docker-compose.yml down

stop : 
	@docker-compose -f ./src/docker-compose.yml stop

start : 
	@docker-compose -f ./src/docker-compose.yml start
reset:
	@docker-compose -f ./src/docker-compose.yml down
	@docker image rm nginx:42 wordpress:42 mariadb:42

status : 
	@docker ps