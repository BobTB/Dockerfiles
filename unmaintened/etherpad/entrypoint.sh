#!/bin/sh -e

addgroup -g ${GID} etherpad && adduser -h /etherpad -s /bin/sh -G etherpad -u ${UID} -D etherpad
chown -R etherpad:etherpad /etherpad

random_key() {
    dd if=/dev/urandom bs=64 count=1 2>/dev/null|sha256sum|cut -d' ' -f1|tr -d '\n'
}

target=/etherpad/node_modules
if [ -d "$target" ]; then
	if find "$target" -mindepth 1 -print -quit | grep -q .; then
        # no files don't do anything
        # we may use this if condition for something else later
        echo not empty, don\'t do anything...
    else
        # we don't have any files, let's copy the
        # files from etc and var to the right locations
        cp -r /modules/* /etherpad/node_modules/
    fi
else
    # directory doesn't exist, we will have to do something here
    echo node_modules not exist exiting
	exit 0
fi
if [ "/etherpad/bin/run.sh" = "$1" ]; then
    [ -r /etherpad/APIKEY.txt ] || random_key > /etherpad/APIKEY.txt
    [ -r /etherpad/SESSIONKEY.txt ] || random_key > /etherpad/SESSIONKEY.txt
    touch /etherpad/node_modules/ep_etherpad-lite/.ep_initialized
    chown -R etherpad:etherpad /etherpad/settings.json /etherpad/var
    exec su-exec etherpad "$@"
fi

exec "$@"
