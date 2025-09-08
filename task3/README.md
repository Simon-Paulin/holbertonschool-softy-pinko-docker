# Task3 - Connecting the Front-end and Back-end

This task connects the static **front-end** served by **Nginx** with the dynamic **back-end API** built with **Flask** inside Docker containers.  
The goal is to display dynamic content from the API on the front-end.

---

## Project Structure

task3/
- back-end/
    - Dockerfile
    - api.py
    - Makefile
- front-end/
    - Dockerfile
    - softy-pinko-front-end
    - softy-pinko-front-end.conf 
    - Makefile


---

## Back-end

### Files
- **Dockerfile**
  - Based on `ubuntu:latest`
  - Installs `python3`, `pip3`, `flask`, and `flask-cors`
  - Copies `api.py` to `/app`
  - Exposes port **5252**

- **api.py**
```python
  from flask import Flask
  from flask_cors import CORS

  app = Flask(__name__)
  CORS(app)

  @app.route('/api/hello')
  def hello_world():
      return 'Hello, World!'

  if __name__ == '__main__':
      app.run(host='0.0.0.0', port=5252)
```

### Commands

From inside `task3/back-end/`:

```bash
make build   # build the Docker image
make run     # run the container in detached mode on port 5252
make logs    # view logs
make test    # test API endpoint with curl
make down    # stop and remove the container
```

Test the API:

```bash
curl http://localhost:5252/api/hello
# -> Hello, World!
```

## Front-end

### Files
- **Dockerfile**
  - Based on `nginx:latest`
  - Copies the cloned `softy-pinko-front-end/` into `/var/www/html/softy-pinko-front-end`
  - Copies the custom Nginx config `softy-pinko-front-end.conf` into `/etc/nginx/conf.d/default.conf`
  - Exposes port **9000**

### Commands
From inside `task3/front-end/`/
```bash
make build   # build the Docker image
make run     # run the container in detached mode on port 9000
make logs    # view logs
make down    # stop and remove the container
```

Access the front-end at:
`http://localhost:9000`

If the back-end is running on port 5252, the `<h1 id="dynamic-content"></h1>` in the front-end will display:
`Hello, World!`
