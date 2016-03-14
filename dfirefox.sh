#!/bin/bash

docker run  -v $HOME/Downloads:/home/firefox/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            -e UID=$(id -u) \
            -e GID=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            -e URL=http://www.docker.com \
            -e "EXTRA_HOSTS=$1" \
            --name firefox \
            --rm \
            spacelis/firefox bash
