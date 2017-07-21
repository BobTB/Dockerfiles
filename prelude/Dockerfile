FROM alpine:3.6

ARG PRELUDE_VERSION=3.1.0
ARG LIB_PRELUDE_NB=721
ARG LIB_PRELUDEDB_NB=722

RUN apk -U upgrade \
    && apk add -t build-dependencies \
       python-dev \
       pcre-dev \
       build-base \
       gcc \
       g++ \
       gnutls-dev \
       libgcrypt-dev \
    && apk add -U \
       python \
       pcre \
       swig \ 
       pkgconf \
       gnutls \
       mariadb-client-libs \
       gnupg \
       wget

RUN cd /tmp \
   && wget --no-check-certificate https://www.prelude-siem.org/attachments/download/${LIB_PRELUDE_NB}/libprelude-${PRELUDE_VERSION}.tar.gz \
   && tar -xzf libprelude-${PRELUDE_VERSION}.tar.gz \
   && cd libprelude-${PRELUDE_VERSION} \
   && ./configure --without-perl --without-lua \
   && ls -la bindings/python \
   && sed -i '1 i\#include <cstddef>' bindings/python/_PreludeEasy.cxx \
   && make \
   && make install 

RUN cd /tmp \
   && wget --no-check-certificate https://www.prelude-siem.org/attachments/download/${LIB_PRELUDEDB_NB}/libpreludedb-${PRELUDE_VERSION}.tar.gz \
   && tar -xzf libpreludedb-${PRELUDE_VERSION}.tar.gz \
   && cd libpreludedb-${PRELUDE_VERSION} \
   && export LD_LIBRARY_PATH=/usr/local/lib \
   && ./configure --without-perl
