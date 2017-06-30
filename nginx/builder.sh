#!/bin/sh

#COMMIT_ID=$(git log -n 1 --pretty=format:%H -- nginx/)
#LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

#if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]; then
   echo "nginx build image"
   docker build -t registry.dryusdan.fr/dryusdan/reverse-nginx --build-arg NGINX_CONF="--prefix=/nginx --sbin-path=/usr/local/sbin/nginx --http-log-path=/nginx/log/nginx_access.log --error-log-path=/nginx/log/nginx_error.log --pid-path=/nginx/run/nginx.pid --lock-path=/nginx/run/nginx.lock --user=reverse --group=reverse --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_stub_status_module --with-threads --with-pcre-jit --with-ipv6 --without-http_ssi_module --without-http_scgi_module --without-http_uwsgi_module --without-http_geo_module --without-http_autoindex_module --without-http_split_clients_module --without-http_memcached_module --without-http_empty_gif_module --add-module=/tmp/headers-more-nginx-module --without-http_browser_module" github.com/xataz/docker-reverse-nginx
   docker push registry.dryusdan.fr/dryusdan/reverse-nginx
   docker rmi registry.dryusdan.fr/dryusdan/reverse-nginx
#else
#   echo "nginx image is recent. No build"
#fi
