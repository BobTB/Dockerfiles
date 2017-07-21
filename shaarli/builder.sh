#!/bin/sh

#COMMIT_ID=$(git log -n 1 --pretty=format:%H -- shaarli/)
#LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

COMMIT_ID=1
LAST_COMMIT_ID=1

if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build --no-cache -t registry.dryusdan.fr/dryusdan/shaarli shaarli/
   docker push registry.dryusdan.fr/dryusdan/shaarli
   docker rmi registry.dryusdan.fr/dryusdan/shaarli
else
   echo "image is recent. No build"
fi
