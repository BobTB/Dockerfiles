# PHP for Fuelphp

[![](https://images.microbadger.com/badges/image/dryusdan/php-fuelphp.svg)](https://microbadger.com/images/dryusdan/php-fuelphp "Get your own image badge on microbadger.com")

Strict minimal version of PHP based on official PHP FPM Alpine

This image can run the Fuelphp with more power and more speed than a classic PHP configuration.

## How to get it ?

`docker pull dryusdan/php-fuelphp`
or
`docker build -t dryusdan/php-fuelphp https://github.com/Dryusdan/Dockerfiles.git#:php/fuelphp`

## How to use it ?
```
docker run \
--name php-fuelphp \
-v /mtn/docker/fuelphp/web:/var/www/html:rw \
--restart always dryusdan/php-fuelphp
```

## Heu...
Don't forgot configure your HTTP server ;) Exemple with nginx : 

```
server {
    listen   80;
    server_name  fuel.localhost;
    index  index.php index.html index.htm;
    merge_slashes off;
    large_client_header_buffers 4 32k;
    root /grav;
    client_max_body_size 1G;


    location / {
        try_files $uri $uri/ /index.php?_url=$uri&$query_string;
    }
        location ~ [^/]\.php(/|$) {
        #try_files $uri =404;
        fastcgi_split_path_info ^(.+?\.php)(/.*)$;
        fastcgi_pass php-fuelphp:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_intercept_errors on;
        fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        internal;
    }

}
```
