#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- presentator)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ "COMMIT_ID" == "LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build -t registry.dryusdan.fr/dryusdan/presentator presentator/
   docker push registry.dryusdan.fr/dryusdan/presentator
   docker rmi registry.dryusdan.fr/dryusdan/presentator
else
   echo "image is recent. No build"
fi
