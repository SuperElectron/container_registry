# AMD64 build commands
container_registry_url = 'registry.url.ca:6981/gitlab-ci-group/gitlab-ci-project'

build_gstreamer:
	docker build -t ${container_registry_url}/gstreamer_arm:latest gstreamer
push_gstreamer:
	docker push ${container_registry_url}/gstreamer_arm:latest
build_api:
	docker build -t ${container_registry_url}/api_arm:latest api
push_api:
	docker push ${container_registry_url}/api_arm:latest
build_database:
	docker build -t ${container_registry_url}/database_arm:latest database
push_database:
	docker push ${container_registry_url}/database_arm:latest
build_kafka:
	docker build -t ${container_registry_url}/kafka0_arm:latest kafka
push_kafka:
	docker push ${container_registry_url}/kafka0_arm:latest
build_fusion:
	docker build -t ${container_registry_url}/fusion_arm:latest fusion
push_fusion:
	docker push ${container_registry_url}/fusion_arm:latest
build_kafkacat:
	docker build -t ${container_registry_url}/kafkacat_arm:latest kafkacat
push_kafkacat:
	docker push ${container_registry_url}/kafkacat_arm:latest
build_zk:
	docker build -t zk_base_arm64 zookeeper/base
	docker build -t ${container_registry_url}/zookeeper_arm:latest zookeeper
push_zk:
	docker push ${container_registry_url}/zookeeper_arm:latest

# Run
build: build_api build_database build_kafka build_fusion build_kafkacat build_zk build_gstreamer
push: push_api push_database push_kafka push_fusion push_gstreamer
build_push: build push

# special builds
build_geodetics_python36:
	docker build -t ${container_registry_url}/gstreamer_arm:latest gstreamer
	docker build -f geodetics/Dockerfile.python36.arm -t ${container_registry_url}/geodetics_python36_arm:latest geodetics
# Clean up!
clean:
	@ echo 'RUN: pruning containers, volumes, and networks'
	docker system prune -a && docker volume prune && docker network prune
	@echo "\n\nChecking docker containers"
	docker ps
