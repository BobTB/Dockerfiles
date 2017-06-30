#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- etherpad/)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ "COMMIT_ID" == "LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build -t registry.dryusdan.fr/dryusdan/etherpad etherpad/ 
   docker push registry.dryusdan.fr/dryusdan/etherpad
   docker rmi registry.dryusdan.fr/dryusdan/etherpad
else
   echo "image is recent. No build"
fi
