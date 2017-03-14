FROM php:7.0-fpm
MAINTAINER Dryusdan

RUN  apt-get update \
     && buildDeps=" \
            libmemcached-dev \
            zlib1g-dev \
			libmcrypt-dev \
			libcurl4-openssl-dev\
     " \
     && doNotUninstall=" \
             libmemcached11 \
             libmemcachedutil2 \
             \
     " \
     && apt-get install -y $buildDeps git --no-install-recommends \
     && rm -r /var/lib/apt/lists/* \
     \
     && docker-php-source extract \
     && git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
     && docker-php-ext-install memcached pdo pdo_mysql mcrypt curl opcache mbstring fileinfo zip\
     \
     && docker-php-source delete \
     && apt-mark manual $doNotUninstall \
     && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps \
         && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin && apt-get autoremove -y && apt-get clean all

COPY php.ini /usr/local/etc/php/
EXPOSE 9000
