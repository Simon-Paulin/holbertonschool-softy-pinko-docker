IMAGE_NAME=softy-pinko-front-end:task5
CONTAINER_NAME=softy-pinko-front-end-task5
HOST_PORT=9000
CONTAINER_PORT=9000

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -p $(HOST_PORT):$(CONTAINER_PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

down:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

logs:
	docker logs -f $(CONTAINER_NAME)
	