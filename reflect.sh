#!/bin/sh
export DOCKERHOST=`getent ahostsv4 host.docker.internal | awk '{ print $1 }'| head -n 1`;

echo "DOCKERHOST: $DOCKERHOST"
echo "Creating full cone nat to $DOCKERHOST"
iptables -t nat -A PREROUTING -j DNAT --to-destination $DOCKERHOST
iptables -t nat -A POSTROUTING -d $DOCKERHOST -j MASQUERADE
echo "Iptables rules created. Going to sleep."
while true; do sleep 30; done;