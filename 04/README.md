# Networking: (Cross-)Container Communication

---

## Running this file

1. Commented the mongodb code initially to test if Docker can talk to WWW which will work
2. Use `host.docker.internal` to replace `localhost` or `127.0.0.1` to make internal connections work
3. Uncomment the mongo code
4. `docker run -d --name mongodb mongo` Create a container based on the `mongo` image from docker-hub.
5. `docker container inspect mongodb` to inspect the container and fetch the `IPAddress` object under `NetworkSettings` object. Note there are multiple `IPAddress` keys. Look for one which is the child of `NetworkSettings`.
6. Run the following

   - `docker build -t favorite-node .` Build the image
   - `docker run --name favorite -d --rm -p 8000:3000 favorite-node:latest` Create a container

   ***

## Setting up docker network

1. Stop the running containers if any
2. `docker container prune` to prune all stopped containers
3. Create a network using `docker network create <name>` like `docker network create favorite-net`
4. Launch a new container in the network `docker run -d --name mongodb --network favorite-net mongo`
5. Now you can replace the ip with the container name and they will talk
6. Run the node app in same network `docker run --name favorite -d --rm -p 8000:3000 --network favorite-net favorite-node:latest`
