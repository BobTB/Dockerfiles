#!/bin/sh
git clone --branch 1.18.0 https://github.com/xwiki-labs/cryptpad.git
docker build -t registry.dryusdan.fr/dryusdan/cryptpad ./cryptpad/Dockerfile
docker push registry.dryusdan.fr/dryusdan/cryptpad
docker rmi registry.dryusdan.fr/dryusdan/cryptpad
rm -rf cryptpad