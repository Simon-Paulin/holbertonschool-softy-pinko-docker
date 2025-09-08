IMAGE_NAME=task0
CONTAINER_NAME=softy-pinko-task0

.PHONY: build run down all

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile .

run:
	docker run --name $(CONTAINER_NAME) $(IMAGE_NAME)

down:
	docker rm $(CONTAINER_NAME)
