FROM        ubuntu:18.04

LABEL       author="Makai Marcell" maintainer="makkmarci03@gmail.com"

RUN         apt-get update \
            && apt-get upgrade -y \
		    && apt-get install -y wget default-jre default-jdk iproute2 \
		    && groupadd -g 2001 container \
		    && useradd -m -d /home/container -g 2001 -u 2001 -s /sbin/nologin container
	
USER        container
ENV         HOME /home/container
WORKDIR     /home/container
	
COPY        ./start.sh /start.sh
CMD         ["/bin/bash", "/start.sh"]
