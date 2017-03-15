FROM node:4.8-alpine
MAINTAINER  Dryusdan

COPY entrypoint.sh /entrypoint.sh
ENV GID=991 UID=991
RUN chmod +x /entrypoint.sh \
    && apk --no-cache add git su-exec curl \
    && mkdir /etherpad\
    && git clone https://github.com/ether/etherpad-lite.git /etherpad \
    && /etherpad/bin/installDeps.sh \
    && apk del git \
    && cd /etherpad \
    && npm i mongodb ep_mypads \
    && rm -rf /tmp/*  /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /etherpad/.git \
	&& mkdir /modules && cd /modules && cp -avr /etherpad/node_modules/* ./

COPY settings.json /etherpad/settings.json
EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etherpad/bin/run.sh"]
