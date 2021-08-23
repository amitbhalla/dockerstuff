# Docker Images & Containers: The Core Building Blocks

---

## How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build .`
3. Run a container based on the created image `docker run <id>`
4. Use `docker ps` to see which containers are **running**
5. Use `docker stop <name>` to stop the existing image
6. Use `docker ps -a` to see all the containers
7. To run docker which can listen to ports use `docker run -p 3000:80 <id>`
8. Use `docker stop <name>` to stop the container

### Changelog

1. Optimized image build by copying package.json and then running npm install before copying rest of the code as rest of the code will keep changing
