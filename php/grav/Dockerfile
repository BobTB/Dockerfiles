FROM php:7.0.15-alpine
MAINTAINER Dryusdan

COPY php.ini /usr/local/etc/php/

RUN buildDeps=" \
            	openssl-dev \
	    	curl-dev \
		libmemcached-dev \
		g++ \
		\
	" \
	&& apk add -U --no-cache $buildDeps curl git libmemcached \
	&& docker-php-source extract \
	&& git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
	&& docker-php-ext-configure curl --with-curl \
	&& docker-php-ext-install curl opcache mbstring zip \
	&& docker-php-source delete \
	&& curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \


RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev \
	&& docker-php-ext-install intl zip soap

RUN apk add --update --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" iconv mcrypt \
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
