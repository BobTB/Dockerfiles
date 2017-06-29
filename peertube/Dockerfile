FROM node:8.1-alpine

RUN apk -U add yarn ffmpeg libressl git \
      && git clone -b master https://github.com/Chocobozzz/PeerTube /PeerTube \
      && cd /PeerTube \
      && yarn install \
      && npm run build \

EXPOSE 9000
