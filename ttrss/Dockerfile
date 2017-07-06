FROM xataz/nginx-php

ENV DB_TYPE=pgsql \
    DB_HOST=localhost \
    DB_USER=ttrss \
    DB_NAME=ttrss \
    DB_PASS=ttrss \
    DB_PORT=5432 \
    DOMAIN=example.org \
    URL="http://example.org/tt-rss/" \
    SINGLE_USER_MODE=false \
    SIMPLE_UPDATE_MODE=false \
    AUTH_AUTO_CREATE=true \
    AUTH_AUTO_LOGIN=true \
    FORCE_ARTICLE_PURGE=0 \
    SPHINX_SERVER="localhost:9312" \
    SPHINX_INDEX="ttrss, delta" \
    ENABLE_REGISTRATION=false \
    REG_NOTIFY_ADDRESS="user@your.domain.dom" \
    REG_MAX_USERS=10 \
    SESSION_COOKIE_LIFETIME=86400 \
    SMTP_FROM_NAME="Tiny Tiny RSS" \
    SMTP_FROM_ADDRESS="noreply@your.domain.dom" \
    DIGEST_SUBJECT="[tt-rss] New headlines for last 24 hours" \
    SMTP_SERVER="localhost:465" \
    SMTP_LOGIN="login" \
    SMTP_PASSWORD="login" \
    SMTP_SECURE="tls" \
    CHECK_FOR_UPDATES="true" \
    ENABLE_GZIP_OUTPUT="false" \
    PLUGINS='auth_internal, note' \
    LOG_DESTINATION="syslog" \
    CONFIG_VERSION=26

RUN apk -U add git \
    && git clone https://tt-rss.org/git/tt-rss.git /tt-rss \
    && apk del git \
    && rm -rf /tmp/* /var/cache/apk/* /usr/src/*

COPY rootfs /
