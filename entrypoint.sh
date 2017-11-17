#!/bin/bash

groupmod -g ${GID:-100} firefox
usermod -u ${UID:-100} -g ${GID:-100} firefox
chown -R firefox:firefox /dev/shm

if [ -e /etc/extra_hosts ]; then
  cat /etc/extra_hosts >> /etc/hosts
fi

if [ -n "EXTRA_HOSTS" ]; then
  echo "$EXTRA_HOSTS" | tr ';' '\n' >> /etc/hosts
fi

dpkg-reconfigure ca-certificates

install -o firefox -g firefox -m 700 -d /home/firefox/.pki
install -o firefox -g firefox -m 700 -d /home/firefox/.pki/nssdb
certutil -d /home/firefox/.pki/nssdb -N --empty-password
for f in /usr/local/share/ca-certificates/*.crt; do
  certutil -d /home/firefox/.pki/nssdb -A -t "C,," -n "Mock CA" -i $f
done


certutil -d /home/firefox/.mozilla/firefox/default -N --empty-password
for f in /usr/local/share/ca-certificates/*.crt; do
  certutil -d /home/firefox/.mozilla/firefox/default -A -t "C,," -n "Mock CA" -i $f
done

chown -R firefox:users /home/firefox/.pki
chown -R firefox:users /home/firefox/.mozilla

exec su -ls "/bin/bash" -c "$*" firefox
# exec bash -c "$*"
