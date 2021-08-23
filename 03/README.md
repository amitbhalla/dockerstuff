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

## Examples

- `docker run -d -p 8000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node`
  - `-d` to run in detached mode
  - `-p 8000:80` maps 8000 port of host machine with 80 port of docker machine
  - `--rm` will remove the container when it shuts down
  - `--name feedback-app` name of the container
  - `-v feedback:/app/feedback` maps the feedback folder on host system with /app/feedback folder inside the container

## Changelog

1. Added `VOLUME [ "/app/feedback" ]` in Dockerfile to create a persistent volume.
2. Added changes to `server.js` as the `rename` method of node doesn't work across devices. Error: `(node:1) UnhandledPromiseRejectionWarning: Error: EXDEV: cross-device link not permitted, rename '/app/temp/awesome.txt' -> '/app/feedback/awesome.txt'` solution, see changes in `server.js` of the commit.
