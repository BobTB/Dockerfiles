FROM alpine:3.5
MAINTAINER Dryusdan

RUN apk add -U --no-cache bash curl \
	&& curl -Ss 'https://raw.githubusercontent.com/firehol/netdata-demo-site/master/install-required-packages.sh' >/tmp/kickstart.sh && bash /tmp/kickstart.sh -i netdata-all \
	&& cd / \
	&& git clone https://github.com/firehol/netdata.git --depth=1 \
	&& cd /netdata \
	&& ./netdata-installer.sh 
	
EXPOSE 19999
ENTRYPOINT["sh /netdata/netdata-installer.sh]