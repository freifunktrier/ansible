#!/bin/bash            
FASTD_PEERS=/etc/fastd/fftr-mesh-vpn/peers
function getCurrentVersion() {
 # Get hash from latest revision
 git log --format=format:%H -1
}
cd $FASTD_PEERS
GIT_REVISION=$(getCurrentVersion)
git commit -m "CRON: auto commit"
git fetch
git merge origin/master -m "Auto Merge"
GIT_NEW_REVISION=$(getCurrentVersion)
if [ $GIT_REVISION != $GIT_NEW_REVISION ]
then
 echo "Reload fastd peers"
 kill -HUP $(pidof fastd)
fi
