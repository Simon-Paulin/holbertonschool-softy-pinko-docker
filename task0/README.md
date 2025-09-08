# Task0 – Makefile Documentation

This directory contains a simple Docker setup for Task0.  
The goal is to build a Docker image based on Ubuntu and run a container that outputs **"Hello, World!"**.

---

## Files
- `Dockerfile`: defines the Docker image (Ubuntu base + echo command).  
- `makefile`: provides convenient shortcuts to build and run the image.  

---

## Makefile Targets

### `make build`
```bash
docker build -t task0 -f Dockerfile .
```

Builds the Docker image named  `task0` using the `Dockerfile` in the current directory.
The `-t` flag assigns a name (`task0`) to the image, and `-f` `Dockerfile` explicitly tells Docker which file to use.

### `make run`
```bash
docker run --name softy-pinko-task0 task0
```

Runs a container named `softy-pinko-task0` based on the `task0` image.
The container executes the default command defined in the `Dockerfile`:
```bash
echo "Hello, World!"
```

After running, the output will appear in the terminal and the container will exit.

### `make down`
```bash
docker rm softy-pinko-task0
```

Removes the container named `softy-pinko-task0`
This is necessary because Docker does not allow reusing the same container name unless the old one is removed.

### Exemple Workflow
```bash
make build      # build the Docker image
make run        # run the container -> prints "Hello, World!"
make down       # remove the container
make all        # build and run in one command
``