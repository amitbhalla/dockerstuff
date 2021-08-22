# Commands
For chapter specific details read the *README.MD* inside the chapters.

----
## Basic Workflow
1. Build an image based on Dockerfile `docker build .`
2. Once an image is built, use `docker run <id>` to run a container from that image
3. Use `docker ps` to see running containers
4. Use `docker stop <container-name>` to stop a running container
5. Use `docker ps -a` to see stopped containers

---
## Managing Images and containers
### Managing Containers
- `docker ps` Shows all running containers
- `docker ps -a` Shows all containers (incl. the stopped containers)
- `docker run <image-id>` starts a *new* container based on an image-id **[See note 1]**
- `docker run -d <image-id>` starts a *new* container based on an image-id in **detached mode** **[See note 1]**
- `docker attach <container-name>` can be used to re-attach the terminal with a running container
- `docker logs <container-name>` Shows past logs of a container **[Happens only one time]**
- `docker logs -f <coontainer-name>` attaches to terminal and starts listening to logs 
- `docker start <container-name>` starts an *existing* container **[See note 2]**
- `docker start -a <container-name>` starts an *existing* container in attached mode **[See note 2]**
- `docker start <container-id>` starts an *existing* container
- `docker stop <container-name>` stops a running container

### Notes
1. `run` starts an image in attached mode **by default**
2. `start` runs an image in detached mode **by default**

---
## Misc Commands
### Mapping Ports
- Example `docker run -p 8000:80 <image-id>` will map `8000` port of your system with `80` port inside docker

### Prune
#### Prune container
- `docker container prune`

#### Prune images
- `docker image prune`

#### Prune system
- `docker system prune -a`
