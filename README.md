# Web Platform Startup

This repository contains a docker definition and script that will get up and running in the minimal amount of time. It's main features are

- Web infrastructure in a box (NGINX, PHP, MySQL, COUCHDB, ELK)
- A toolchain image that provides tools you will need as a developer

This stack doesn't require moving any project files, they should be stored separately. I have included some of the notes from a knowledge sharing session as a short reference to Docker in general after the instructions.

## Usage

*IMPORTANT NOTE* - If this is the first time you are using this repository, please look through the `docker-compose.yml` and `docker-compose-developer-php7.yml` files before running any of the below commands and follow the instructions included.

You have the following options which act as very simple proxy commands to the docker daemon. Most often, you will just want to run `make dev`.

- prod - Standard (minimalist) setup up and running
- down - Make sure there are no running containers
- build - Prepare the images for the standard setup. This will be run automatically if needed when using prod alone.
- dev - Get a developers setup up and running. This extends the prod definition and adds extra tools to the environment container, mailhog, and ELK.
- dev-build - Prepare images for dev environment
- pull - Reach out to the image repositories and download any images defined. This will be run automatically if necessary.

# Docker
[Docker](https://www.docker.com/) is a collection of three tools:

Docker Engine - The lowest level of the Docker stack; a middleware engine for translating a common docker API in to the most suitable runtime solution on the host.

Docker Compose - Define various docker elements and settings within a single schema, extending capabilities to handle replication.

Docker Swarm - A cluster system which automatically handles distribution of tasks, moving up to hybrid cloud

``` bash
docker --version
docker-compose-version
```

## Containers

Docker Engine runs as a daemon which can be contacted via sockets or traffic. The containers we are going to run are stored in a local image repository; if image is found, Docker will then try to find the containers in remote image repositories (default is [Docker Hub](https://hub.docker.com/)) to make them available.

```
# https://hub.docker.com/_/hello-world/
docker run hello-world
```

More on running slightly later on

## Making the images

Creating a container for yourself is very simple and straight forward. Let's take a look at the `Dockerfile` which contains the build instructions.

[Official Dockerfile Documentation](https://docs.docker.com/engine/reference/builder/)

- **FROM** determines what image is used as a base for your own. You can get micro-images that have only a few features up to Ubuntu Desktop; there are distinct benefits and costs to either approach.
A good choice is [Alpine Linux](https://alpinelinux.org/); minimal, simple, and secure; it also has a package manager
- **ARG** is used to bring external parameters in to the build process
- **USER** switches system user within the container as it is building
- **RUN** is your bread and butter, responsible for running shell commands
- **WORKDIR**, when the container launches this is the current working directory
- **CMD** is the process that gets run when the user calls for the container


```
# Build the image with a tag
docker build -t yourimage .
# List the currently available images
docker images
# Run the container interactively
docker run -it yourimage
```

## Bringing it forward with Docker Compose

Docker has some very powerful functions for controlling the way a container interacts with the host, wider network, and storage. For example, you have `-p` for forwarding a port from container to host (and vice versa) and `-v`for volume management and storage.

Whilst necessary to have on the command line, this approach can seem quite long winded if reused or shared. The second layer of the Docker stack is docker-compose. This should make sense to people who have worked with `yaml` before.

Talking through the compose file we are working on today.

- Should always start off with a version declaration. Further info found on the [site here](https://docs.docker.com/compose/compose-file/); in short, version 2 is the most widely used for the moment.
- Each service represents a container runtime definition which at a minimum has an image name and / or a build definition
- Networking is just a matter of using `links` for internal communication and `ports` to proxy communication through Docker
- Volumes allow for data within containers to be persisted and also paths on the host machine to be linked inside a container

The main commands we want are:

``` bash
docker-compose up
# Run the above as a daemon
docker-compose up -d
# Run the above using a custom docker-compse file
docker-compose up -f docker-compose.yml -f docker-compose-developer-php7.yml
# Stop the docker collection
docker-compose down
```
