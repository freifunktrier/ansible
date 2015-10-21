#!/bin/sh
cd /var/www/html/traffic
for i in t m s; do
        for j in fftr-mesh-vpn icvpn; do
                vnstati -$i -i $j -o vnstati-$i-$j.png
        done
done
