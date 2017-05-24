FROM php:7.1-apache	

RUN apt-get update && apt-get install -y \	
	openssl \
	libcurl3 \
	libmcrypt-dev \
	curl \
	git \
	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev 

RUN docker-php-source extract \
     && docker-php-ext-configure curl --with-curl \
     && docker-php-ext-configure openssl --with-openssl=/etc/openssl \
     && docker-php-ext-install spl pdo pdo_mysql mcrypt curl opcache openssl mbstring fileinfo zip Reflection pcre intl icu dom \
     && docker-php-source delete \
     && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin
