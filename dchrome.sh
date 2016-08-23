#!/bin/bash

# ./dchrome.sh 'xxx.yyy.com' '192.168.0.x'
# ./dchrome.sh 'xxx.yyy.com'

if [ $# -eq 2 ]; then
  extra_resolv="--add-host=$1:$2"
  url=$1
elif [ $# -eq 1 ]; then
  url=$1
fi

docker run \
    --memory 2048mb \
    -v /dev/shm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/.Xauthority:ro \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    -e XAUTHORITY=/.Xauthority \
    -e DISPLAY=$DISPLAY \
    $extra_resolv \
    --name chromium \
    --rm \
    spacelis/firefox chromium --no-sandbox "'$url'"
