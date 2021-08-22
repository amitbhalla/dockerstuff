# How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build .`
3. Run a container based on the created image `docker run <image-id>` **_This will give an error._** [See note 1]
4. Use `docker run -it <image-id>` to run - **_This will work._**
5. Use `docker ps` to see the running containers
6. Use `docker stop <container-name>` to stop the container
7. To start and attach a terminal to give CLI inputs use `docker start -ai <container-name>`

# Notes

1. This file wants to listen to user inputs over CLI, so we cannot just use `docker run <image-id>` directly. We have to use the interactive mode.

## Changelog
