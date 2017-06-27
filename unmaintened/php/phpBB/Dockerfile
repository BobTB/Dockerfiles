FROM php:5.6-fpm
MAINTAINER Dryusdan

RUN apt-get update && apt-get install -y libmcrypt-dev libcurl4-openssl-dev \
	 && rm -rf /var/lib/apt/lists/* \
     && docker-php-source extract \
     && docker-php-ext-install mysqli mcrypt curl opcache mbstring fileinfo \
     && docker-php-source delete \
	 && apt-get update \
     && buildDeps=" \
             git \
             libmemcached-dev \
             zlib1g-dev \
     " \
     && doNotUninstall=" \
             libmemcached11 \
             libmemcachedutil2 \
     " \
     && apt-get install -y $buildDeps --no-install-recommends \
     && rm -r /var/lib/apt/lists/* \
     \
     && docker-php-source delete \
     && apt-mark manual $doNotUninstall \
     && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps \
	 && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin && apt-get autoremove -y && apt-get clean all

COPY php.ini /usr/local/etc/php/

EXPOSE 9000
