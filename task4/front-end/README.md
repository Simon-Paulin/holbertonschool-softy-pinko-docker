# Task2 - Front-end (Nginx)

This part of the project serves the static front-end of **Softy Pinko** using **Nginx** inside a Docker container.

## Project Structure
task2/
- front-end/
- Dockerfile
- Makefile
- softy-pinko-front-end/ # cloned repo
- softy-pinko-front-end.conf # Nginx config


## Dockerfile
- Base image: `nginx:latest`
- Copies the static site into `/var/www/html/softy-pinko-front-end`
- Copies the custom Nginx config to `/etc/nginx/conf.d/default.conf`
- Exposes port **9000**

## Nginx Configuration

`softy-pinko-front-end.conf`:
```nginx
server {
    listen 9000;
    server_name localhost;

    root /var/www/html/softy-pinko-front-end;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Explanation

listen 9000 → Nginx listens on port 9000 inside the container.

server_name localhost → Matches local requests (you access it via `http://localhost:9000`).

root → Points to the folder where the site files were copied in the Docker image.

index index.html → Default file served when accessing `/`.

location / { try_files $uri $uri/ =404; } → Ensures only existing files are served. If a file does not exist, a 404 error is returned instead of a blank response.
This configuration is minimal but ensures your front-end files are served correctly and safely.

## Makefile Commands
From inside `task2/front-end`

### Build the image

```bash
make build
```

### Run the container

```bash
make run
```

This runs Nginx in detached mode on port 9000.
Access the site at: `http://localhost:9000`

### View logs

```bash
make logs
```

Shows real-time Nginx logs.

### Stop and remove the container

```bash
make down
```

## Notes

- Port 9000 is mapped from container to host.
- Use `make down` before rerunning if the container name is already in use, unless `--rm` is enabled in the `Makefile`.