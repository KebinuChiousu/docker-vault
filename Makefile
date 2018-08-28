OWNER=meredithkm
IMAGE=vault
CONTAINER=${IMAGE}

build:
	docker build -t ${OWNER}/${IMAGE} .
start:
	rm -f ./docker-compose.yml
	sed "s|CURRENT_WORKING_DIRECTORY|${PWD}/docker-data|"g docker-compose.tmpl > ./docker-compose.yml
	docker-compose up -d
stop:
	docker-compose down
destroy:
	docker-compose down -v
check:
	docker-compose ps
inspect:
	docker inspect ${CONTAINER}
status:
	docker exec -e VAULT_ADDR='http://127.0.0.1:8200' ${CONTAINER} vault status
check_init:
	curl http://127.0.0.1:8200/v1/sys/init
logs:
	docker logs ${CONTAINER}
