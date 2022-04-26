# Create build and start containers
up:
	docker-compose -f srcs/docker-compose.yml up -d 
# Stop and delete containers
down:
	docker-compose -f srcs/docker-compose.yml down 

# CLI nginx
exec_nginx:
	docker exec -it con_nginx bash
# CLI wordpress
exec_wordpress:
	docker exec -it con_wordpress bash
# CLI db
exec_db:
	docker exec -it con_db bash

# Clear volume directories and recreate them
re_volumes:
	sudo rm -rf /home/dkarisa/data; mkdir -p /home/dkarisa/data/db_data; mkdir /home/dkarisa/data/wordpress_data;
# Rebuild db
re_db :	re_volumes
	docker-compose -f srcs/docker-compose.yml build db
# Rebuild wordpress
re_word : re_volumes
	docker-compose -f srcs/docker-compose.yml build wordpress
# Rebuild nginx
re_nginx : re_volumes
	docker-compose -f srcs/docker-compose.yml build nginx

# Remove untagged images
rmi :
	docker rmi $$(docker images -f "dangling=true" -q)

# Delete everything before evaluation
eval: re_volumes
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null
