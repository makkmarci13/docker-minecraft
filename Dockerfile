FROM        openjdk:8u212-jre-alpine

LABEL       author="makkmarci13" maintainer="makkmarci03@gmail.com"

RUN apk add --no-cache -U \
    openssl \
    imagemagick \
    lsof \
    su-exec \
    shadow \
    bash \
    curl iputils wget \
    jq \
    tzdata \
    rsync \
    nano \
    python python-dev py2-pip

RUN         useradd -d /home/container -m container \
            && cd /home/container \
            && wget https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar

ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ./entrypoint.sh 119
