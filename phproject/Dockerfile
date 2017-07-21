FROM xataz/nginx-php

ENV UID=991 \
    GID=991 \
    PUBLIC_URL=phproject.org \
    PHPROJECTVERSION=1.5.2

RUN apk add -U wget \
	&& cd /tmp \
        && wget https://github.com/Alanaktion/phproject/archive/v${PHPROJECTVERSION}.tar.gz \
        && tar -xvf v${PHPROJECTVERSION}.tar.gz \
        && mv phproject-${PHPROJECTVERSION}/ /phproject \
	&& cd /phproject \
	&& apk del wget \
	&& rm -rf /tmp/* /var/cache/apk/* /usr/src/* 

COPY rootfs/ /

RUN chmod +x /usr/local/bin/startup

VOLUME /phproject/upload
