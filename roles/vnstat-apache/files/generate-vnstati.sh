#!/bin/sh
cd /var/www/html/traffic
for i in t m s; do
        for j in fvpn fvpn_01 fvpn_02 fvpn_03 fvpn_04 fvpn_05 icvpn; do
                vnstati -$i -i $j -o vnstati-$i-$j.png
        done
done
