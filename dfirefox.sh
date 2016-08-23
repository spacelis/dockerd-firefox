#!/bin/bash

# ./dfirefox.sh 'xxx.yyy.com' '192.168.0.x'
# ./dfirefox.sh 'xxx.yyy.com'

if [ $# -eq 2 ]; then
  extra_resolv="--add-host=$1:$2"
  url=$1
elif [ $# -eq 1 ]; then
  url=$1
fi

docker run  -v $HOME/Downloads:/home/firefox/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            -e UID=$(id -u) \
            -e GID=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            $extra_resolv \
            --name firefox \
            --rm \
            spacelis/firefox "/usr/bin/firefox -profile /home/firefox/.mozilla/firefox -setDefaultBrowser '$url'"
