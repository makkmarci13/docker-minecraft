FROM        ubuntu:latest

LABEL       author="makkmarci13" maintainer="makkmarci03@gmail.com"

RUN         apt update \
            && apt upgrade -y \
            && apt install -y tar curl iproute2 openssl wget default-jre default-jdk \

RUN         useradd -d /home/container -m container \
            && cd /home/container \
            && wget https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar

ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD          ["/bin/bash", "/entrypoint.sh"]
