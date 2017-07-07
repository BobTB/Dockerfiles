FROM alpine:3.6

ARG RETHINKDB_VERSION=2.3.5

RUN apk -U update \
    && apk -U add -ti build-deps \
       build-base \
       gnupg \
       tar \
       automake \
       autoconf \
       binutils \
    && apk -U add libcurl \
       libressl \
       python \
       boost \
       ncurses \
       jemalloc \
       protobuf \
       wget \
    && cd /tmp \
    && wget https://download.rethinkdb.com/dist/rethinkdb-$RETHINKDB_VERSION.tgz \
    && tar xf rethinkdb-$RETHINKDB_VERSION.tgz \
    && cd rethinkdb-$RETHINKDB_VERSION \
    && ./configure --allow-fetch \
    && make
