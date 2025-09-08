IMAGE_NAME=task0
CONTAINER_NAME=softy-pinko

build:
	docker build -t $(IMAGE_NAME) -f task0 .

run:
	docker run -it --rm --name $(CONTAINER_NAME) $(IMAGE_NAME)
