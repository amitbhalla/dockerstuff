# How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build -t feedback-node .`
3. Run a container based on the created image `docker run -p 8000:80 -d --name feedback-app --rm feedback-node`
4. Use `docker ps` to see the running containers
5. Use `docker stop feedback-app` to stop the container
6. Running changes with just changelog 1 and 2 will still not work. See below for more.
7. While the container is runinng you can use `docker volume ls` to see the name of the annoynmous volume
8. We need a named volume, which cannot be done inside a Dockerfile. Hence remove `VOLUME` from it
9. To provide named volume you should use it a param when running a container. See Examples 1.
10. do a `docker volume ls` after stopping the container.
11. If you remove the existing container and start a new one with mapped `-v` flag the data would be preserved
12. Linking a bount mount requires `-v` **twice**. See **Example 02**.
13. This will crash and you will have to remove `-d` and check `docker logs feedback-app` which will say `Express` is missing.
14. This happens because mounting the local folder (which doesn't have dependencies) will override the /app created by Dockerfile during image creation
15. We will use a 3rd volume to seperate out node packages into an anonymous mount. See **Example 03**.

## Examples 01

- `docker run -d -p 8000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node`
  - `-d` to run in detached mode
  - `-p 8000:80` maps 8000 port of host machine with 80 port of docker machine
  - `--rm` will remove the container when it shuts down
  - `--name feedback-app` name of the container
  - `-v feedback:/app/feedback` maps the feedback folder on host system with /app/feedback folder inside the container

## Example 02

- `docker run -d -p 8000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/bhallaamit/Desktop/docker/03:/app" feedback-node`
  - `-d` to run in detached mode
  - `-p 8000:80` maps 8000 port of host machine with 80 port of docker machine
  - `--rm` will remove the container when it shuts down
  - `--name feedback-app` name of the container
  - `-v feedback:/app/feedback` maps the feedback folder on host system with /app/feedback folder inside the container
  - `-v "/Users/bhallaamit/Desktop/docker/03:/app"` Full absolute path, followed by a `:` then the path inside the container. Use quotes if there are spaces in path.

## Example 03

- `docker run -d -p 8000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/bhallaamit/Desktop/docker/03:/app" -v /app/node_modules feedback-node`
  - `-d` to run in detached mode
  - `-p 8000:80` maps 8000 port of host machine with 80 port of docker machine
  - `--rm` will remove the container when it shuts down
  - `--name feedback-app` name of the container
  - `-v feedback:/app/feedback` maps the feedback folder on host system with /app/feedback folder inside the container
  - `-v "/Users/bhallaamit/Desktop/docker/03:/app"` Full absolute path, followed by a `:` then the path inside the container. Use quotes if there are spaces in path.
  - `-v /app/node_modules` will preserve the node_modules dir created with the image when the volume gets mounted.

## Changelog

1. Added `VOLUME [ "/app/feedback" ]` in Dockerfile to create a persistent volume.
2. Added changes to `server.js` as the `rename` method of node doesn't work across devices. Error: `(node:1) UnhandledPromiseRejectionWarning: Error: EXDEV: cross-device link not permitted, rename '/app/temp/awesome.txt' -> '/app/feedback/awesome.txt'` solution, see changes in `server.js` of the commit.
