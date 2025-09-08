# Task1 – Flask API with Docker and Makefile shortcut

## Available commands

All commands must be executed from the `task1/` directory.

### Build the image
```bash
make build
```
Builds the Docker image `task1` from the `Dockerfile`.

### Run the Container
```bash
make run
```
Runs the container `softy-pinko-task1` and exposes the Flask server on port `5252`.

### Test th API
In another terminal, the container running.
```bash
make test
```
Sends an HTTP GET request to `http://localhost:5252/api/hello`

Expected result:
````
Hello, World!
````

### Stop and remove the container
```bash
make down
```

Stops and removes the container `softy-pinko-task1`

### Complete workflow

```bash
make build      # build the image
make run        # run the Flask container
# in another terminal:
make test       # test the endpoint
make down       # stop and remove the container
```
