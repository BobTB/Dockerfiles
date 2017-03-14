FROM php:7.0-fpm-alpine
MAINTAINER Dryusdan

RUN buildDeps=" \
            libmemcached-dev \
            zlib-dev \
            openssl-dev \
	    cyrus-sasl-dev \
	    libmcrypt-dev \
	    curl-dev \
     " \
     && apk add -U --no-cache $buildDeps libmemcached libmcrypt curl git \
     && docker-php-source extract \
     && git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
     && docker-php-ext-configure curl --with-curl \
     && docker-php-ext-install memcached pdo pdo_mysql mcrypt curl opcache mbstring fileinfo zip \
     && docker-php-source delete \
     && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
     && apk del $buildDeps \
     && rm -rf /tmp/* /var/cache/apk/* /usr/src/*

COPY php.ini /usr/local/etc/php/
EXPOSE 9000
