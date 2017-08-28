# Etherpad container with alpine and MyPads

[![](https://images.microbadger.com/badges/image/dryusdan/etherpad-mypad.svg)](https://microbadger.com/images/dryusdan/etherpad-mypad "Get your own image badge on microbadger.com")

- Image build with Alpine 
- Build with MyPads extentions by default
- Etherpad not run as roo

## How this ?
[Etherpad](https://github.com/ether/etherpad-lite) is a doc writter like Google Docs, but it self hosting, and customizable.
With [MyPads](https://framagit.org/framasoft/ep_mypads) extentions to share, read and write doc easier.

## How to get it ?

With docker pull : `docker pull dryusdan/etherpad-mypad` 
Or with Docker build : `docker build -t dryusdan/etherpad-mypads https://github.com/Dryusdan/Dockerfiles.git#:etherpad`

## How to run it ?

To run it : 
```
docker run \
--name pad \
-v /mnt/docker/pad/var:/etherpad/var:rw \
-v /mnt/docker/pad/node_modules:/etherpad/node_modules \
--restart always -d dryusdan/etherpad-mypad
```
By default, Etherpad launch on port 9000
But for more convenience, I recommend using a reverse proxy with this conf : 

```
server {
    listen 8000;
    server_name localhost;
    include /conf.d/headers.conf;

    location / {
        proxy_pass http://etherpad/mypads/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

     location /p/ {
        proxy_pass http://etherpad/p/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

     location /static/ {
        proxy_pass http://etherpad/static/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /mypads/ {
        proxy_pass http://etherpad/mypads/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /admin/ {
        proxy_pass http://etherpad/admin/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /socket.io/ {
        proxy_pass http://etherpad/socket.io/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /locales.json {
        proxy_pass http://etherpad/locales.json;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /javascripts/ {
        proxy_pass http://etherpad/javascripts/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

    location /pluginfw/ {
        proxy_pass http://etherpad/pluginfw/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

     location /locales/ {
        proxy_pass http://etherpad/locales/;
        proxy_read_timeout  3600;
        include /conf.d/proxy-params.conf;
    }

}
```