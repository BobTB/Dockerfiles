FROM xataz/nginx-php

ENV UID=991 GID=991 \
    APP_KEY=null \
    APP_ENV=development \
    APP_DEBUG=true \
    APP_URL=http://localhost \
    APP_LOG=errorlog \
    DB_DRIVER=pgsql \
    DB_HOST=postgres \
    DB_DATABASE=cachet \
    DB_PREFIX=cht_ \
    DB_USERNAME=postgres \
    DB_PASSWORD=postgres \
	DB_PORT=5432 \
	CACHE_DRIVER=none \
	SESSION_DRIVER=cookie \
	SESSION_DOMAIN=http://localhost \
	SESSION_SECURE_COOKIE=false \
	QUEUE_DRIVER=database \
	CACHET_EMOJI=false \
	CACHET_BEACON=true \
	CACHET_AUTO_TWITTER=false \
	MAIL_DRIVER=smtp \
	MAIL_HOST=localhost \
	MAIL_PORT=25 \
	MAIL_USERNAME=null \
	MAIL_PASSWORD=null \
    MAIL_ADDRESS=null \
    MAIL_NAME=null \
    MAIL_ENCRYPTION=null \
    REDIS_HOST=null \
    REDIS_DATABASE=null \
    REDIS_PORT=null \
    REDIS_PASSWORD=null \
    GITHUB_TOKEN=null \
    NEXMO_KEY=null \
    NEXMO_SECRET=null \
    NEXMO_SMS_FROM=null 


RUN apk -U add git curl \
    && git clone --branch v2.3.13 https://github.com/CachetHQ/Cachet.git /cachetHQ \
COPY rootfs /
WORKDIR cachetHQ
RUN chmod +x /usr/local/bin/startup \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer install --no-dev \
 	&& apk del git curl \
    && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /cachetHQ/.git
