# How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build -t feedback-node .`
3. Run a container based on the created image `docker run -p 8000:80 -d --name feedback-app feedback-node`
4. Use `docker ps` to see the running containers
5. Use `docker stop <container-name>` to stop the container

# Extra

# Notes

## Changelog
