#!/bin/sh -e

addgroup -g ${GID} etherpad && adduser -h /etherpad -s /bin/sh -G etherpad -u ${UID} -D etherpad
chown -R etherpad:etherpad /etherpad

random_key() {
    dd if=/dev/urandom bs=64 count=1 2>/dev/null|sha256sum|cut -d' ' -f1|tr -d '\n'
}

if [ "/etherpad/bin/run.sh" = "$1" ]; then
    [ -r /etherpad/APIKEY.txt ] || random_key > /etherpad/APIKEY.txt
    [ -r /etherpad/SESSIONKEY.txt ] || random_key > /etherpad/SESSIONKEY.txt
    touch /etherpad/node_modules/ep_etherpad-lite/.ep_initialized
    chown -R etherpad:etherpad /etherpad/settings.json /etherpad/var
    exec su-exec etherpad "$@"
fi

exec "$@"
