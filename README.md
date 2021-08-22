# Commands

For chapter specific details read the *README.MD* inside the chapters.


## Basic Workflow
1. Build an image based on Dockerfile `docker build .`
2. Once an image is built, use `docker run <id>` to run a container from that image
3. Use `docker ps` to see running containers
4. Use `docker stop <name>` to stop a running container
5. Use `docker ps -a` to see stopped containers


## Misc Commands

### Mapping Ports
- Example `docker run -p 8000:80 <id>` will map `8000` port of your system with `80` port inside docker

### Prune
#### Prune container
- `docker container prune`
#### Prune images
- `docker image prune`
#### Prune system
- `docker system prune -a`
