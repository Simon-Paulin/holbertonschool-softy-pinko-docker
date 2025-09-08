IMAGE_NAME=task1
CONTAINER_NAME=softy-pinko-task1

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile .

run:
	docker run -d -p 0.0.0.0:5252:5252 --name $(CONTAINER_NAME) $(IMAGE_NAME)
	
test:
	curl http://0.0.0.0:5252/api/hello

down:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)cd task