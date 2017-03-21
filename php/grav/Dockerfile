FROM php:7.0.15-alpine
MAINTAINER Dryusdan

RUN buildDeps=" \
        zlib-dev \
        openssl-dev \
	    cyrus-sasl-dev \
	    curl-dev \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		" \
		&& apk add -U --no-cache $buildDeps libmcrypt libmcrypt-dev curl git \
		&& docker-php-source extract \
		docker-php-ext-configure gd \
			--with-freetype-dir=/usr/include/ \
			--with-png-dir=/usr/include/ \
			--with-jpeg-dir=/usr/include/ \
		&& docker-php-ext-configure curl --with-curl \
		&& docker-php-ext-install gd mcrypt curl opcache mbstring zip xml apcu yaml \
		&& docker-php-source delete \
		&& curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
		&& apk del $buildDeps \
		&& rm -rf /tmp/* /var/cache/apk/* /usr/src/*
		
COPY php.ini /usr/local/etc/php/
EXPOSE 9000
