#!/bin/sh
cd /var/www/html/traffic
for i in h d t m s; do
        for j in fvpn fvpn_01 fvpn_02 fvpn_03 fvpn_04 fvpn_05 icvpn ens3 eth0 eth1; do
                vnstati -$i -i $j -o vnstati-$i-$j.png
        done
done
