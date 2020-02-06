#!/bin/bash
for i in $(vnstat --iflist | sed "s/Available interfaces: //" |  sed -e "s/([^)]*)//g"); do
        echo "creating $i"
        sudo -u vnstat vnstat -u -i $i
done
