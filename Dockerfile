FROM debian:jessie

RUN dpkg --add-architecture i386 && apt-get update -y

# HP MyRoom direct dependencies
RUN apt-get install -y libc6:i386 libstdc++6:i386 libuuid1:i386 libxtst6:i386 libpulse0:i386 libglib2.0-0:i386 libx11-xcb1:i386 libxi6:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libpng12-0:i386 libsm6:i386 libxfixes3:i386 libxss1:i386

# Extras
RUN apt-get install -y xkb-data

COPY hpmyroom.deb /hpmyroom.deb
RUN dpkg -i /hpmyroom.deb

ENTRYPOINT ["/usr/bin/hpmyroom"]
