FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN BUILD_DEPS=" \
	git \
	curl \
	apt-transport-https \
	ca-certificates \
	wget \
	bcrypt \
	build-essential" \
  && sudo curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && apt-get update \
  && apt-get install -y -q --no-install-recommends ffmpeg openssl gnupg nodejs ${BUILD_DEPS} \
  && git clone -b master https://github.com/Chocobozzz/PeerTube /PeerTube \
  && cd PeerTube \
  && npm install npm --global \
  && yarn install \
  && npm run build \
  && cp config/production.yaml.example config/production.yaml \
  && apt-get purge -y ${BUILD_DEPS} \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /PeerTube/.git \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/debconf/*-old \
  && rm -rf /usr/share/man/?? \
  && rm -rf /usr/share/man/??_*
