#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- php/grav/)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build -t registry.dryusdan.fr/dryusdan/php:grav php/grav/
   echo "push image"
   docker push registry.dryusdan.fr/dryusdan/php:grav
   docker rmi registry.dryusdan.fr/dryusdan/php:grav
else
   echo "image is recent. No build"
fi
