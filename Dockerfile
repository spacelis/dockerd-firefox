FROM debian:jessie
MAINTAINER Wen Li <wen.li@ucl.ac.uk>
# --TAG: spacelis/firefox

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m firefox && \
    echo 'deb http://packages.linuxmint.com debian import' > /etc/apt/sources.list.d/linuxmint.list && \
    gpg --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2 && \
    gpg --export 3EE67F3D0FF405B2 > 3EE67F3D0FF405B2.gpg && \
    apt-key add ./3EE67F3D0FF405B2.gpg && \
    rm ./3EE67F3D0FF405B2.gpg && \
    apt-get update && \
    apt-get remove iceweasel && \
    apt-get install -y --no-install-recommends  firefox \
                                                dbus-x11 \
                                                libfreetype6 \
                                                libfontconfig1 \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev
RUN apt-get install -y --no-install-recommends  libxdamage1 libxcomposite1 libasound2 libdbus-glib-1-2
RUN apt-get install -y --no-install-recommends  libgtk2.0-0
RUN apt-get install -y --no-install-recommends  libxt6
RUN rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
