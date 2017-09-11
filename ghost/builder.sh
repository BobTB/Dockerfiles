#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- ghost/)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ -n "$1" ]; then
   FORCE_BUILD=$1
else
   FORCE_BUILD=0
fi

if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]  || [ "$FORCE_BUILD" -eq "1" ]; then
   echo "build image"
   docker build --no-cache -t registry.dryusdan.fr/dryusdan/ghost ghost/
   docker push registry.dryusdan.fr/dryusdan/ghost
   docker rmi registry.dryusdan.fr/dryusdan/ghost
else
   echo "image is recent. No build"
fi
