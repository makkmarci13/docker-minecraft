FROM        openjdk:8u212-jre-alpine

LABEL       author="makkmarci13" maintainer="makkmarci03@gmail.com"

RUN         apt update \
            && apt upgrade -y \
            && apt install -y wget  \
            && useradd -d /home/container -m container \
            && cd /home/container
            && wget https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar

ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ./entrypoint.sh 119
