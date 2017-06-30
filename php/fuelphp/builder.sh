#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- php/fuelphp/)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build -t registry.dryusdan.fr/dryusdan/php:fuelPHP php/fuelphp/
   docker push registry.dryusdan.fr/dryusdan/php:fuelPHP
   docker rmi registry.dryusdan.fr/dryusdan/php:fuelPHP
else
   echo "image is recent. No build"
fi
