#!/bin/sh
cd /var/lib/dhcp-static
/usr/bin/git pull
/usr/sbin/service isc-dhcp-server restart
