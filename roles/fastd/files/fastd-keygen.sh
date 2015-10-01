#!/bin/sh
cd "$1"
umask 077
echo -n 'secret "' > secret.conf
echo -n "$(fastd --generate-key --machine-readable)" >> secret.conf
echo '";' >> secret.conf
