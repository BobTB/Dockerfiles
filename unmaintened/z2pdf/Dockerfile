FROM openjdk:8-jre-alpine
MAINTAINER Dryusdan
ENV UID=991 GID=991

RUN apk add -U wget glib \
&& sed -i -e 's/v3\.4/edge/g' /etc/apk/repositories \
&& echo https://conoria.gitlab.io/alpine-pandoc/ >> /etc/apk/repositories \
&& echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
&& apk --no-cache add ca-certificates \
&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk \
&& apk add --no-cache --allow-untrusted -U --force cmark@testing pandoc pandoc-citeproc zip texlive-full su-exec\
&& mkdir /opt && mkdir /opt/z-to-pdf \
&& wget https://github.com/firm1/zest-writer/releases/download/0.4.0/zmarkdown2pdf.zip \
&& unzip zmarkdown2pdf.zip -d /opt/z-to-pdf \
&& mv /opt/z-to-pdf/zmarkdown2pdf/* /opt/z-to-pdf \
&& rm -rf /opt/z-to-pdf/.git \
&& rm -rf /var/cache/apk/* /tmp/* 

WORKDIR /opt/z-to-pdf
COPY conf/ ./
RUN chmod +x ./start.sh 
EXPOSE  8082
ENTRYPOINT ["./start.sh"] 
CMD ["java", "-jar", "/opt/z-to-pdf/zmarkdown2pdf-0.0.1-SNAPSHOT-fat.jar", "-conf", "/opt/z-to-pdf/conf.json"]
