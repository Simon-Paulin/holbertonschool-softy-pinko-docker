# Task5 - Proxy Server

This task introduces a **proxy server** using **Nginx** in front of the back-end (Flask API) and front-end (Nginx static site).  
The proxy acts as the **single entry point** for clients, routing requests to the correct service.

---

## Project Structure

task5/
- back-end/ (Flask API)
- front-end/ (Nginx static site)
- proxy/
  - Dockerfile
  - proxy.conf
- docker-compose.yml
- Makefile

---

## Proxy

### Files

- **Dockerfile**
  - Based on `nginx:latest`
  - Copies `proxy.conf` to `/etc/nginx/conf.d/default.conf`

- **proxy.conf**

```nginx
server {
      listen 80;
      server_name localhost;

      location / {
          proxy_pass http://front-end:9000;
      }

      location /api {
          proxy_pass http://back-end:5252;
      }
  }
```
- Requests to `/` → sent to front-end
- Requests to `/api` → sent to back-end

## Docker Compose

**docker-compose.yml**

- Defines three services:
  - `back-end` → Flask API
  - `front-end` → Nginx static site
  - `proxy` → Nginx proxy

- Only the proxy exposes a port (`80:80`)

- Internal communication uses service names (`front-end`, `back-end`)

- `depends_on` ensures `proxy` waits for both services

## Makefile

A Makefile at the root simplifies commands:

```bash
make build      # Build all images with docker compose
make up         # Start all services in detached mode
make logs       # View logs from all services
make ps         # List running containers
make use-front  # Open a shell inside the front-end container
make use-back   # Open a shell inside the back-end container
make use-proxy  # Open a shell inside the proxy container
make down       # Stop and remove all containers
```

## Usage

### Build and start all services

```bash
make build
make up
```

### Access the Application

Open your browser at:

```arduino
http://localhost
```

- `/` → serves the front-end
- `/api/hello` returns `Hello, World!` from the back-end

### Verify containers are running

You can check the logs whit:

```bash
make logs
```

You should see the proxy, front-end, and back-end starting.
For example, the proxy logs will confirm it is listening on port 80 and forwarding traffic:

```less
proxy-1  | 2023/06/15 [notice] ... nginx/1.25.1
proxy-1  | 2023/06/15 [notice] ... start worker processes
```
