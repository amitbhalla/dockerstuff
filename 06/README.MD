# Docker util containers

---

## How to run

1. `docker build -t node-util .` Builds the image
2. `docker run -it node-util npm init` Set's the default command
3. `docker run -it -v /Users/bhallaamit/Desktop/docker/06:/app node-util npm init` bind the current folder to container folder

---

## Extra

1. `docker-compose run npm init`

   - `run` will allow you to send commands via docker-compose
   - `npm` is the name of the service in yaml
   - `init` is the command after the enterypoint

2. You can also use `docker-compose run --rm npm init`
