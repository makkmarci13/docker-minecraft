#!/bin/bash
cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

usermod -u $1 container

su container

MODIFIED_STARTUP=`java -Xms1024M -Xmx1024M -jar spigot-1.12.2.jar --max-players 5 --port 25565 nogui`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
