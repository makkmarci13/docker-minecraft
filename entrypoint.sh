#!/bin/bash

cd /home/container
usermod -u 119 container
chown container:119 /home/container
su container

chmod g+w /home/*

MODIFIED_STARTUP=`java -Xms1024M -Xmx1024M -jar spigot-1.12.2.jar --max-players 5 --port 25565 nogui`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
exec ${MODIFIED_STARTUP}
