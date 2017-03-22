FROM php:7.0.15-alpine
MAINTAINER Dryusdan

COPY php.ini /usr/local/etc/php/

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

RUN apk add --no-cache --virtual .persistent-deps \
    # for intl extension
    icu-dev \
    # for mcrypt extension
    libmcrypt-dev \
    # for soap
    libxml2-dev \
    zeromq

RUN buildDeps="autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    make \
    git \
    pkgconf \
    re2c" \
	&& set -xe \
    && apk add --no-cache --virtual .build-deps \
        $buildDeps \
        openssl-dev \
        zeromq-dev \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-configure soap --enable-soap \
    && docker-php-ext-install \
        intl \
        mcrypt \
        pcntl \
        mbstring \
        soap \
		zip \
    && apk del .build-deps \
    && rm -rf /tmp/*

RUN buildDeps2=" libmemcached-dev \
		g++ \
		cyrus-sasl-dev \
		\
	" \
	&& apk add -U --no-cache $buildDeps2 git libmemcached \
	&& docker-php-source extract \
	&& git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
	&& docker-php-ext-configure memcached --disable-memcached-sasl \
	&& docker-php-ext-install memcached \
	&& docker-php-source delete

RUN buildDeps=" \
        openssl-dev \
            curl-dev \
                g++ \
                \
        " \
        && apk add -U --no-cache $buildDeps curl libcurl \
        && docker-php-source extract \
	&& docker-php-ext-configure curl \
        && docker-php-ext-install curl \
        && docker-php-source delete \
        && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

RUN apk add --update --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd

RUN docker-php-source extract \
    && apk add --no-cache --virtual .phpize-deps-configure $PHPIZE_DEPS \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apk del .phpize-deps-configure \
	&& docker-php-source delete

RUN apk add --update --no-cache autoconf g++ imagemagick-dev libtool make \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
	&& apk del autoconf g++ libtool make

EXPOSE 9000
