FROM python:3.4.5-alpine
MAINTAINER Dryusdan <contact@dryusdan.fr> # avec l'aide de Xataz
ENV UID=991 GID=991 \
        SECRET_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789 \
        SALT=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789 \
        MAIL_SERVER= \
        MAIL_PORT=465 \
        MAIL_USERNAME= \
        MAIL_PASSWORD= \
        MAIL_TLS=false \
        MAIL_SSL=true \
        REDIS_URL=localhost \
        REDIS_PORT=6379 \
        MEMCACHED_SERVER=127.0.0.1:11211

RUN mkdir /Onyx \
        && BUILD_DEPS=" \
    build-base \
    cyrus-sasl-dev \
        linux-headers \
        libsasl \
        libssl1.0 \
        openssl-dev \
        zlib-dev \
        libffi \
        python3-dev \
        libmemcached-dev " \
        && apk --update add \
        ${BUILD_DEPS} \
        su-exec \
        curl \
        git \
        nodejs \
        memcached  \
        openssl  \
        && apk add --virtual python-software-properties \
        && pip3 install psutil python-memcached virtualenv setuptools pylibmc \
        && git clone https://github.com/OnyxProject/Onyx.git /Onyx && cd /Onyx/ && chmod +x launch.sh \
        && pip3 install -r requirements.txt \
        && cd /Onyx/ && make \
        && apk del ${BUILD_DEPS} \
        && rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ /Onyx/.git

WORKDIR /Onyx/

ADD config.py onyx/config.py
ADD start.sh start.sh

RUN chmod +x start.sh

VOLUME /Onyx/data
EXPOSE 5080
ENTRYPOINT ["./start.sh"]
CMD ["python3", "manage.py", "runserver", "-h", "0.0.0.0", "-p", "5080", "-d", "-r"]
