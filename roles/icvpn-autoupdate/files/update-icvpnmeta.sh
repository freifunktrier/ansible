#!/bin/sh
cd /var/lib/icvpn/icvpn-meta
git pull

sudo -u nobody /var/lib/icvpn/icvpn-scripts/mkbgp -4 -f bird -d peers -s /var/lib/icvpn/icvpn-meta -x trier -t berlin:uplink_peers | sed 's/protocol bgp berlin2 from uplink_peers {/protocol bgp berlin2 from prefered_uplink_peers {/' > /etc/bird/bird.d/icvpn.conf
sudo -u nobody /var/lib/icvpn/icvpn-scripts/mkroa -4 -f bird -s /var/lib/icvpn/icvpn-meta > /etc/bird/roa4.con
birdc configure

sudo -u nobody /var/lib/icvpn/icvpn-scripts/mkbgp -6 -f bird -d peers -s /var/lib/icvpn/icvpn-meta -x trier -t berlin:uplink_peers | sed 's/protocol bgp berlin2 from uplink_peers {/protocol bgp berlin2 from prefered_uplink_peers {/' > /etc/bird/bird6.d/icvpn.conf
sudo -u nobody /var/lib/icvpn/icvpn-scripts/mkroa -6 -f bird -s /var/lib/icvpn/icvpn-meta > /etc/bird/roa6.con
birdc6 configure

sudo -u nobody /var/lib/icvpn/icvpn-scripts/mkdns -f bind -s /var/lib/icvpn/icvpn-meta -x trier > /etc/bind/ic.conf
service bind9 reload
