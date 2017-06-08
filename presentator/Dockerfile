FROM xataz/nginx-php

ENV UID=991 \
    GID=991 \
    PUBLIC_URL=app.presentator.io \
    API_URI=api.presentator.io \
    SALT=1234 \
    API_SALT=1234 \
    RECAPTCHA_KEY=1234 \
    RECAPTCHA_SECRET=1234 \
    NOREPLY_MAIL=no-reply@exemple.tld \
    SUPPORT_MAIL=support@exemple.tld \
    DB_HOST=localhost \
    DB_NAME=presentator \
    DB_USERNAME=presentator \
    DB_PASSWORD=1234 \
    SMTP_HOST=smtp.exemple.tld \
    SMTP_USERNAME=no-reply@exemple.tld \
    SMTP_PASSWORD=14234 \
    SMTP_PORT=465

RUN apk add -U git \
	&& curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin \
	&& cd / && git clone https://github.com/ganigeorgiev/presentator.git \
	&& cd /presentator \
	&& composer global require "fxp/composer-asset-plugin:^1.3.1" \
	&& composer install \
	&& php /presentator/init --env=Production --overwrite=n \
	&& apk del git \
	&& rm -rf /tmp/* /var/cache/apk/* /usr/src/* \
        && rm -rf /presentator/.git/

COPY rootfs/ /

RUN chmod +x /usr/local/bin/startup

VOLUME /presentator/app/web/assets /presentator/app/web/uploads /presentator/app/runtime /presentator/api/runtime
