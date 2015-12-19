#!/bin/bash
for i in $(vnstat --iflist | sed "s/Available interfaces: //"); do
        echo "creating $i"
        sudo -u vnstat vnstat -u -i $i
done
