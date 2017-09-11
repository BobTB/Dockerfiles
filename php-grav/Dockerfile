FROM php:7.1-fpm-alpine
MAINTAINER Dryusdan

COPY php.ini /usr/local/etc/php/

RUN apk add -U --no-cache --virtual .persistent-deps \
		icu-dev \
		libmcrypt-dev \
		libxml2-dev \
		zeromq \
		git \
		libmemcached \
		curl \
		libcurl \
		freetype-dev \
		libjpeg-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
		imagemagick-dev \
		pcre-dev \
    && apk add -u --no-cache --virtual .build-deps \
		autoconf \
		cmake \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		git \
		pkgconf \
		re2c \
		openssl-dev \
		zeromq-dev \
		libmemcached-dev \
		cyrus-sasl-dev \
		openssl-dev \
		curl-dev \
		libtool \
    && docker-php-source extract \
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
    && git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
    && docker-php-ext-configure memcached --disable-memcached-sasl \
    && docker-php-ext-install memcached \
    && docker-php-ext-configure curl \
    && docker-php-ext-install curl \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
    && docker-php-source delete \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/cache/apk/* /usr/src/*

EXPOSE 9000
