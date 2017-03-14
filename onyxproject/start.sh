#!/bin/sh

addgroup -g ${GID} onyx && adduser -h /home/onyx -s /bin/sh -G onyx -u ${UID} -D onyx

sed -i -e 's|<secret_key>|'${SECRET_KEY}'|' \
        -e 's|<salt>|'${SALT}'|' \
        -e 's|<mail_server>|'${MAIL_SERVER}'|' \
        -e 's|<mail_port>|'${MAIL_PORT}'|' \
        -e 's|<mail_username>|'${MAIL_USERNAME}'|' \
        -e 's|<mail_password>|'${MAIL_PASSWORD}'|' \
        -e 's|<mail_tls>|'${MAIL_TLS}'|' \
        -e 's|<mail_ssl>|'${MAIL_SSL}'|' \
        -e 's|<redis_url>|'${REDIS_URL}'|' \
        -e 's|<redis_port>|'${REDIS_PORT}'|' \
        -e 's|<mecached_server>|'${MEMCACHED_SERVER}'|' /Onyx/onyx/config.py
chown -R $UID:$GID ./

if [ $# -eq 0 ]; then
    exec su-exec onyx:onyx python3 manage.py runserver -h 0.0.0.0 -p 5080 -d -r
else
    exec su-exec onyx:onyx $@
fi