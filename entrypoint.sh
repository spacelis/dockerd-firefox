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

exec su -ls "/bin/bash" -c "/usr/bin/firefox -profile /home/firefox/.mozilla/firefox -setDefaultBrowser $ARGS $URL" firefox
