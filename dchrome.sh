#!/bin/bash

# ./dchrome.sh 'xxx.yyy.com:192.168.0.x' Mock_CA.crt
# ./dchrome.sh 'xxx.yyy.com:192.168.0.x'
# ./dchrome.sh 'xxx.yyy.com'

extra_resolv=
added_certs=
url=
while [ $# -gt 0 ]; do
  if [[ $1 =~ \.crt$ ]]; then
    added_certs="$added_certs -v$(pwd)/$1:/usr/local/share/ca-certificates/$(basename $1)"
  else
    extra_resolv="$extra_resolv --add-host=$1"
    url=$(cut -d: -f1 <<< $1)
  fi
  shift
done

url=${url:-https://data.cdrc.ac.uk}


docker run \
    --memory 2048mb \
    -v /dev/shm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/.Xauthority:ro \
    $added_certs \
    -e "UID=$(id -u)" \
    -e "GID=$(id -g)" \
    -e XAUTHORITY=/.Xauthority \
    -e "DISPLAY=$DISPLAY" \
    $extra_resolv \
    --name chromium \
    --rm \
    spacelis/dbrowser chromium --no-sandbox "'$url'"
