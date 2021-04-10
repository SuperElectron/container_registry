# START PROJECT
start:
	sysctl -w vm.max_map_count=262144
	docker-compose up -d --build
	@echo "Kibana: http://localhost:5601"
	@echo "elasticsearch: http://localhost:9200"
	@echo "logstash: localhost : 5044"
	@echo "\nFirst, view your elasticsearch setup here: http://localhost:9200/_search?pretty&size=1000\n"
	@echo "\n>>>>>  IT MAY TAKE A MINUTE FOR KIBANA TO BE AVAILABLE  <<<<<  \n"

stop:
	docker-compose down
stop-clean:
	@echo "Stop and prune"
	docker-compose down --rmi all --volumes --remove-orphans
	docker image prune --filter label=stage=ui-builder --force
clean:
	@ echo 'RUN: pruning containers, volumes, and networks'
	docker system prune -a && docker volume prune && docker network prune
	@echo "\n\nChecking docker containers"
	docker ps