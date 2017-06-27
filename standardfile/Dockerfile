FROM node:6-alpine

RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
} >> /usr/local/etc/gemrc \
  && apk --update --upgrade add git curl wget ruby ruby-dev ruby-bundler ruby-io-console ruby-json ruby-bigdecimal zlib-dev mysql-dev build-base tzdata \
  && gem install -N rails --version "$RAILS_VERSION" \
  && echo 'gem: --no-document' >> ~/.gemrc \
  && cp ~/.gemrc /etc/gemrc \
  && chmod uog+r /etc/gemrc \
  # cleanup and settings
  && npm install -g bower \
  && rm -rf ~/.gem \
  && rm -rf /tmp/*  /var/cache/apk/* /tmp/* /root/.gnupg /root/.cache/ \
  && git clone https://github.com/standardfile/ruby-server.git standardfile \
  && cd standardfile \
  && gem install bigdecimal \
  && echo "bundle install" \
  && bundle config --global silence_root_warning 1 \
  && bundle install --system \
  && echo "bower install" \
  && bower install --allow-root \
  && echo "bundle precompile" \
  && bundle exec rake assets:precompile

EXPOSE 3000

COPY /docker /docker

ENTRYPOINT [ "/docker/entrypoint" ]
CMD [ "start" ]
