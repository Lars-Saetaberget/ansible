#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Please run as root or sudo"
	exit 1
fi

apt install ansible

# Set correct interface name for i3status
iface=$(netstat -i | egrep -v "Kernel|Iface|^lo " | cut -f 1 -d ' ')
sed -i "s/ethernet [a-z0-9]* {/ethernet $iface {/" i3status.conf
sed -i "s/ethernet [a-z0-9]*\"/ethernet $iface\"/" i3status.conf

./default.yaml
