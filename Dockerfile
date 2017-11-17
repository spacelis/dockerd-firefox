FROM debian:sid
MAINTAINER Wen Li <wen.li@ucl.ac.uk>
# --TAG: spacelis/dbrowser

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m firefox && \
    apt-get update && \
    apt-get install -y --no-install-recommends  \
      firefox \
      dbus-x11 \
      libfreetype6 \
      libfontconfig1 \
      libxext-dev \
      libxrender-dev \
      chromium \
      libxtst-dev \
      libxdamage1 libxcomposite1 libasound2 libdbus-glib-1-2 \
      libgtk2.0-0 \
      libxt6 \
      libnss3-tools \
      ca-certificates
RUN rm -rf /var/lib/apt/lists/*

RUN install -o firefox -g firefox -m 700 -d /home/firefox/.mozilla/firefox/default
ADD ./profiles.ini /home/firefox/.mozilla/firefox

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
