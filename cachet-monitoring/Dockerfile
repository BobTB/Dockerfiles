FROM golang:1.8-alpine

ARG VERSION=3.0

ADD monitoring/ /monitoring
WORKDIR /monitoring/

RUN apk -U add wget ca-certificates \
&& wget https://github.com/CastawayLabs/cachet-monitor/releases/download/v${VERSION}/cachet_monitor_linux_amd64 \
&& mv cachet_monitor_linux_amd64 cachet-monitor \
&& chmod +x cachet-monitor \
&& chmod +x start.sh

ENTRYPOINT ["./start.sh"]
CMD ["./cachet-monitor", "-c", "/monitoring/config.json"]
