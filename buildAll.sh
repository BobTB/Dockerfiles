docker build --no-cache -t registry.dryusdan.fr/dryusdan/etherpad etherpad/
docker push registry.dryusdan.fr/dryusdan/etherpad
docker rmi registry.dryusdan.fr/dryusdan/etherpad

docker build --no-cache -t registry.dryusdan.fr/dryusdan/kresus kresus/
docker push registry.dryusdan.fr/dryusdan/kresus    
docker rmi registry.dryusdan.fr/dryusdan/kresus

docker build --no-cache -t registry.dryusdan.fr/dryusdan/reverse-nginx --build-arg NGINX_CONF="--prefix=/nginx --sbin-path=/usr/local/sbin/nginx --http-log-path=/nginx/log/nginx_access.log --error-log-path=/nginx/log/nginx_error.log --pid-path=/nginx/run/nginx.pid --lock-path=/nginx/run/nginx.lock --user=reverse --group=reverse --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_stub_status_module --with-threads --with-pcre-jit --with-ipv6 --without-http_ssi_module --without-http_scgi_module --without-http_uwsgi_module --without-http_geo_module --without-http_autoindex_module --without-http_split_clients_module --without-http_memcached_module --without-http_empty_gif_module --add-module=/tmp/headers-more-nginx-module --without-http_browser_module" github.com/xataz/docker-reverse-nginx
docker push registry.dryusdan.fr/dryusdan/reverse-nginx
docker rmi registry.dryusdan.fr/dryusdan/reverse-nginx

docker build --no-cache -t registry.dryusdan.fr/dryusdan/peertube peertube/
docker push registry.dryusdan.fr/dryusdan/peertube
docker rmi registry.dryusdan.fr/dryusdan/peertube

docker build --no-cache -t registry.dryusdan.fr/dryusdan/php:fuelPHP php/fuelphp/
docker push registry.dryusdan.fr/dryusdan/php:fuelPHP
docker rmi registry.dryusdan.fr/dryusdan/php:fuelPHP

docker build --no-cache -t registry.dryusdan.fr/dryusdan/php:grav php/grav/
docker push registry.dryusdan.fr/dryusdan/php:grav
docker rmi registry.dryusdan.fr/dryusdan/php:grav

docker build --no-cache -t registry.dryusdan.fr/dryusdan/presentator presentator/
docker push registry.dryusdan.fr/dryusdan/presentator
docker rmi registry.dryusdan.fr/dryusdan/presentator

docker build --no-cache -t registry.dryusdan.fr/dryusdan/standardfile standardfile/
docker push registry.dryusdan.fr/dryusdan/standardfile
docker rmi registry.dryusdan.fr/dryusdan/standardfile

docker build --no-cache -t registry.dryusdan.fr/dryusdan/standardnotes standardnotes/
docker push registry.dryusdan.fr/dryusdan/standardnotes
docker rmi registry.dryusdan.fr/dryusdan/standardnotes

docker build --no-cache -t registry.dryusdan.fr/dryusdan/z2pdf z2pdf/
docker push registry.dryusdan.fr/dryusdan/z2pdf
docker rmi registry.dryusdan.fr/dryusdan/z2pdf

docker build --no-cache -t registry.dryusdan.fr/dryusdan/piwik github.com/Wonderfall/dockerfiles.git#master:piwik
docker push registry.dryusdan.fr/dryusdan/piwik
docker rmi registry.dryusdan.fr/dryusdan/piwik
