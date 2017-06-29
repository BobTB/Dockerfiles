FROM node:8.1-alpine

ENV UID=991 GID=991 \
    HTTPS=false \
    HOSTNAME=peertube.localhost \
    PORT=80 \
    DATABASE_HOST=localhost \
    DATABASE_PORT=5432 \
    DATABASE_USERNAME=peertube \
    DATABASE_PASSWORD=peertube \
    ADMIN_EMAIL=admin@domain.local \
    SIGNUP_ENABLE=false \
    TRANSCODING_ENABLE=false \
    TRANSCODING_THREADS=2

RUN apk -U upgrade \
    && apk add -t build-dependencies \
       git \
       build-base \
       g++ \
       python \
    && apk -U add yarn ffmpeg libressl su-exec \
      && git clone -b master https://github.com/Chocobozzz/PeerTube /PeerTube \
      && cd /PeerTube \
      && yarn install \
      && npm install \
      && npm run build \
      && apk del build-dependencies \
      && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /PeerTube/.git

COPY rootfs /

RUN chmod +x /usr/local/bin/startup

WORKDIR /PeerTube/
VOLUME ["/PeerTube/certs", "/PeerTube/videos", "/PeerTube/logs", "/PeerTube/previews", "/PeerTube/thumbnails", "/PeerTube/torrents"]
EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/startup"]
