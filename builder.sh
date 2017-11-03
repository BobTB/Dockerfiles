#!/bin/sh

f_build_and_push() {
   COMMIT_ID=$(git log -n 1 --pretty=format:%H -- ghost/)
   LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)
   FOLDERNAME=$1
   FORCE_BUILD=$2
   
   if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ] || [ "$FORCE_BUILD" -eq "1" ]; then
      echo "**** Build $FOLDERNAME image ***"
      docker build --no-cache -t registry.dryusdan.fr/dryusdan/$FOLDERNAME $FOLDERNAME/
      docker push registry.dryusdan.fr/dryusdan/$FOLDERNAME
      docker rmi registry.dryusdan.fr/dryusdan/$FOLDERNAME
   else
      echo "image is recent. No build"
   fi
}

LOG_FILE=log.log
ERR_FILE=error.log

exec 1>$LOG_FILE
exec 2>$ERR_FILE

if [ -n "$1" ]; then
   if [ "$1" == "1" ]; then
      FORCE_BUILD=$1
   else
      if [[ "$1" =~ [A-Za-z] ]]; then
         FOLDERNAME=$1
      fi
   fi
   if [ -n "$2" ]; then
      if [ "$2" == "1" ]; then
         FORCE_BUILD=$2
      else
         FORCE_BUILD=0
      fi
   fi
else
   FORCE_BUILD=0
fi

echo "**** START BUILDER ****"

if [ -n "$FOLDERNAME" ]; then
   echo "**** START BUILD FOR $FOLDERNAME ****"
   f_build_and_push $FOLDERNAME $FORCE_BUILD
else
    echo "**** START BUILD ALL IMAGE ****"
    for directory in * ; do
       if [ -f "$directory/Dockerfile" ]; then
	       f_build_and_push $directory $FORCE_BUILD
       else
           if [ -f "$directory/builder.sh" ]; then
               sh $directory/builder.sh
           fi
       fi
    done
    git push --mirror git@github.com:Dryusdan/Dockerfiles.git
fi
