# holbertonschool-softy-pinko-docker

This repository contains a series of tasks (`task0` → `task6`) designed to progressively build and manage a full web application using **Docker** and **Docker Compose**.  
The project covers containerization, static and dynamic servers, orchestration with Compose, proxying, and horizontal scaling.

---

## Requirements

- [Docker](https://docs.docker.com/get-docker/) (latest version recommended)

---

## Repository Structure

- holbertonschool-softy-pinko-docker/
    - task0/ # Basic Dockerfile (Hello, World!)
    - task1/ # First API with Flask
    - task2/ # Separate front-end and back-end
    - task3/ # Connect front-end and back-end
    - task4/ # Orchestration with Docker Compose
    - task5/ # Add Nginx proxy server
    - task6/ # Horizontal scaling with multiple API servers

Each task contains:
- Its own **Dockerfiles**
- A **Makefile** to simplify usage
- A **README.md** with detailed instructions

---

## Usage

Clone the repository:

```bash
git clone https://github.com/Simon-Paulin/holbertonschool-softy-pinko-docker.git
cd holbertonschool-softy-pinko-docker

Navigate into the task directory you want to run:
```bash
cd task4
make build   # build images
make up      # run services
make logs    # view logs
make down    # stop and clean up
```

For tasks with Docker Compose (from task4 onward), all services can be managed together.
Some tasks also include shortcuts like `make use-front` or `make use-back` to enter a container shell.

## Notes

- When ports are already allocated, ensure to `make down` before relaunching.
- From task5, external access should go through the proxy (`http://localhost`).
- From task6, scaling is possible with:

```bash
make scale   # or use docker compose up --scale back-end=2 -d
```

- Logs are very useful to confirm communication between services:

```bash
make logs
```

## Technologies Used

- 🐳 [Docker](https://www.docker.com/) – Containerization  
- ⚓ [Docker Compose](https://docs.docker.com/compose/) – Orchestration  
- 🐍 [Python 3](https://www.python.org/) – Back-end language  
- 🔥 [Flask](https://flask.palletsprojects.com/) – Web framework (API)  
- 🌐 [Nginx](https://nginx.org/) – Static server & reverse proxy  
- 📜 Make – Task automation (shortcuts for build/run/logs)  

## Author

Project done by Simon Paulin as part of the Holberton School curriculum.
