FROM xataz/nginx-php

ENV UID=991 GID=991 

RUN apk -U add git curl \
    && git clone --branch v2.3.13 https://github.com/CachetHQ/Cachet.git /cachetHQ \
	&& cd /cachetHQ \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer install --no-dev -o \
 	&&  apk del git curls \
    && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /cachetHQ/.git


COPY rootfs /