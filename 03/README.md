# How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build -t feedback-node .`
3. Run a container based on the created image `docker run -p 8000:80 -d --name feedback-app --rm feedback-node`
4. Use `docker ps` to see the running containers
5. Use `docker stop feedback-app` to stop the container
6. Running changes with just changelog 1 and 2 will still not work. See below for more.

## Changelog

1. Added `VOLUME [ "/app/feedback" ]` in Dockerfile to create a persistent volume.
2. Added changes to `server.js` as the `rename` method of node doesn't work across devices. Error: `(node:1) UnhandledPromiseRejectionWarning: Error: EXDEV: cross-device link not permitted, rename '/app/temp/awesome.txt' -> '/app/feedback/awesome.txt'` solution, see changes in `server.js` of the commit.
