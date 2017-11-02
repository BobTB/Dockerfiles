FROM xataz/nginx-php

ENV UID=991 GID=991 

RUN apk -U add git curl \
    && git clone --branch v2.3.13 https://github.com/CachetHQ/Cachet.git /cachetHQ \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=compose \
	&& composer install --no-dev -o

COPY rootfs /