# Task4 - Making it Simpler with Docker Compose

This task introduces **Docker Compose** to simplify the management of multiple containers.  
Instead of starting the back-end and front-end manually, Docker Compose handles both at once.

---

## Project Structure

task4/
- back-end/ (Flask API)
- front-end/ (Nginx static site)
- docker-compose.yml
- Makefile

---

## Docker Compose

### docker-compose.yml
- Defines **two services**:
  - `back-end` → Flask API on port **5252**
  - `front-end` → Nginx serving static files on port **9000**
- Both services share the same network automatically created by Compose
- `depends_on` ensures `back-end` starts before `front-end`
- Ports mapped:
  - `5252:5252`
  - `9000:9000`

With this setup, running both services becomes a single command.

---

## Makefile

To simplify usage even further, a **Makefile** is provided at the root of task4.

### Commands

```bash
make build      # Build both images using docker compose
make up         # Start all services in detached mode
make logs       # View logs from all services
make ps         # List running containers
make use-front  # Open a shell inside the front-end container
make use-back   # Open a shell inside the back-end container
make down       # Stop and remove all containers
```

## Notes

---

Use `make up` to run the full stack (front-end + back-end).

The API is available at: `http://localhost:5252/api/hello`.

The front-end is available at: `http://localhost:9000`.

Run `make down` after testing to stop and clean containers.

The commands `make use-front` and `make use-back` are useful to open a shell inside running containers.
- This allows you to inspect the environment, debug issues, or verify that files and processes are running as expected.

- Since the containers are running in the background (`-d` mode), these commands provide a convenient way to connect without restarting them.