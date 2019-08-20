#!/bin/bash
# Make an INTERNAL Ip Address
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
# Echo STARTUP
echo ":/home/container$ ${STARTUP}"
# Run the Server
exec ${STARTUP}
