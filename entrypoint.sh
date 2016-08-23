#!/bin/bash

groupmod -g ${GID:-100} firefox
usermod -u ${UID:-100} -g ${GID:-100} firefox

if [ -e /etc/extra_hosts ]; then
  cat /etc/extra_hosts >> /etc/hosts
fi

if [ -n "EXTRA_HOSTS" ]; then
  echo "$EXTRA_HOSTS" | tr ';' '\n' >> /etc/hosts
fi

if [ -d /home/firefox/.mozilla ]; then
  chown -R firefox:firefox /home/firefox/.mozilla
fi
chown -R firefox:firefox /dev/shm

exec su -ls "/bin/bash" -c "$*" firefox
# exec bash -c "$*"
