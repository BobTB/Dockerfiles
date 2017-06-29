FROM node:8.1-alpine

RUN apk -U add yarn ffmpeg libressl git \
      && git clone -b master https://github.com/Chocobozzz/PeerTube /PeerTube \
      && cd /PeerTube \
      && yarn install \
      && npm run build \
      && apk del git \
      && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /PeerTube/.git

EXPOSE 9000
ENTRYPOINT ['start']
