# Running this file

1. Commented the mongodb code initially to test if Docker can talk to WWW which will work
2. Use `host.docker.internal` to replace `localhost` or `127.0.0.1` to make internal connections work
3. Uncomment the mongo code
4. `docker run -d --name mongodb mongo` Create a container based on the `mongo` image from docker-hub.
5. `docker container inspect mongodb` to inspect the container and fetch the `IPAddress` object under `NetworkSettings` object. Note there are multiple `IPAddress` keys. Look for one which is the child of `NetworkSettings`.
6. Run the following
   - `docker build -t favorite-node .` Build the image
   - `docker run --name favorite -d --rm -p 8000:3000 favorite-node:latest` Create a container
