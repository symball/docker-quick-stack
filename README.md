# Web Platform Startup

This repository contains a docker definition and script that will get up and running in the minimal amount of time. It's main features are

- Web infrastructure in a box (NGINX, PHP, MySQL, COUCHDB, ELK)
- A toolchain image that provides tools you will need as a developer

This stack doesn't require moving any project files, they should be stored separately. I have included some of the notes from a knowledge sharing session as a short reference to Docker in general after the instructions.

## TODO

[ ] Configure the ELK stack to work with new directory layout  

[ ] Add better Phing support

## Usage

*NOTE* - If this is the first time you are using Docker, you are recommended to read the [Official Documentation](https://docs.docker.com/compose/compose-file/compose-file-v2/) explaining the syntax but, there are also notes in the `docker-compose.yml` and `docker-compose-developer-php7.yml` files.

You have the following options which act as very simple proxy commands to the docker daemon. Most often, you will just want to run `make dev` or `make legacy`.

- prod - Standard (minimalist) setup up and running using the equivalent of what we run in production
- down - Make sure there are no running containers
- build - Prepare the images for the standard setup. This will be run automatically if needed when using prod alone.
- dev - Get a developers setup up and running. This extends the prod definition and adds extra tools to the environment container, mailhog, and ELK.
- dev-build - Prepare images for dev environment
- pull - Reach out to the image repositories and download any images defined. This will be run automatically if necessary.

## Exposing your Services

Nginx should be the only container that exposes or forwards ports on to the host for purposes of load balancing and simplified configuration. To make this easier for you, there is a folder containing a set of predefined configurations located at `./docker/nginx/config_library`.
Configuration files should either be copied or creates symlinks to either the `dev_config` or `prod_config` folders, being sure to use the correct `http` or `stream` services folder.