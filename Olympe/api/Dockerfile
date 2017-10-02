FROM xataz/nginx-php

ENV UID=991 \
    GID=991 

RUN mkdir /sites-enabled \
    && apk add -U git \
    && git clone --recursive https://git.drycat.fr/Dryusdan/Olympe-phpAPI.git /api \
    && apk del git \
    && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /api/.git

COPY rootfs /

RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
