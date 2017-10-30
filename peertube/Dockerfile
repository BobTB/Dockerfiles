FROM debian:jessie-slim

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
    TRANSCODING_THREADS=2 \
    BODY_SIZE=100M \
	DEBIAN_FRONTEND=noninteractive


RUN echo "deb http://ftp.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get -y install ffmpeg openssl curl git build-essential nginx --no-install-recommends\
	&& apt-get clean \
	&& curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update \
	&& apt-get -y install -y nodejs yarn --no-install-recommends \
	&& git clone https://github.com/Chocobozzz/PeerTube /PeerTube \
	&& cd /PeerTube \
	&& npm install \
	&& yarn install \
	&& npm run build \
	&& apt-get purge -y  build-essential curl \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /PeerTube/.git \
	&& rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/debconf/*-old \
	&& rm -rf /usr/share/man/?? \
	&& rm -rf /usr/share/man/??_*


EXPOSE 8080

COPY rootfs /

RUN chmod +x /usr/local/bin/startup

WORKDIR /PeerTube/
VOLUME ["/PeerTube/certs", "/PeerTube/videos", "/PeerTube/logs", "/PeerTube/previews", "/PeerTube/thumbnails", "/PeerTube/torrents"]
ENTRYPOINT ["/usr/local/bin/startup"]
