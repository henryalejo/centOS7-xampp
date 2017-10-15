dockerfiles-centos7
=========================

CentOS 7 dockerfile Xampp


Get Docker version

    # docker version

To build This project with docker-compose

    # docker-compose build

To run:

    # docker-compose up

To use bash with your container

To get the id

    # docker ps

To connect with bash

    # docker exec -it <id> bash


At docker-compose.yml you can change where is your php project, replace ./share with your working directory, for further information check docker volumes documentation.

Some useful docker commands for this project:

    # docker ps
    # docker exec -it <id> bash
    # docker-compose build
    # docker-compose up
    # docker images
    # docker images -a
    # docker rmi $(docker images -a -q)
    # docker rm $(docker ps -a -q)


Other commands
To build:

Copy the sources down and do the build.

    # docker build -t <username>/centos7_web .

To run (if port 8080 is open on your host):

    # docker run -d -p 8080:8080 <username>/centos7_web

or to assign a random port that maps to port 80 on the container:

    # docker run -d -p 8080 <username>/centos7_web

To the port that the container is listening on:

    # docker ps

To test:

    # curl http://localhost:8080
