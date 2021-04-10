docker_login:
	docker login https://registry.url.ca:6981

permisions:
	@echo "chown -R $USER:$USER *"
	@echo "chmod -R 777 *"

clean:
	@ echo 'RUN: pruning containers, volumes, and networks'
	docker system prune -a && docker volume prune && docker network prune
	@echo "\n\nChecking docker containers"
	docker ps