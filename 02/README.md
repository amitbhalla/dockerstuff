# Managing Data & Working with Volumes

## How to run

1. Create the Dockerfile
2. Build an image based on Dockerfile `docker build .`
3. Run a container based on the created image `docker run <image-id>` **_This will give an error._** [See note 1]
4. Use `docker run -it <image-id>` to run - **_This will work._**
5. Use `docker ps` to see the running containers
6. Use `docker stop <container-name>` to stop the container
7. To start and attach a terminal to give CLI inputs use `docker start -ai <container-name>`

### Extra

- `docker cp SOURCE_PATH <container-name>:DEST_PATH` Copies the content from user machine to a container
  - Example: `docker cp SomeFolder/. Some_Container_Name:/FolderInsideDocker` will copy all the `SomeFolder` and all its content to a new folder called `FolderInsideDocker` which will be inside the last `WORKDIR`
- `docker cp <container-name>:SOURCE_PATH DEST_PATH` Will bring files from docker container to the local folder
  - Example: `docker cp Some_Container_Name:/FolderInsideDocker SomeFolder` will bring content of `FolderInsideDocker` to `SomeFolder` in your project

### Notes

1. This file wants to listen to user inputs over CLI, so we cannot just use `docker run <image-id>` directly. We have to use the interactive mode.

###xx Changelog

1. Added Copy logic
