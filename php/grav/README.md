# PHP for Grav CMD
Strict minimal version of PHP based on official PHP FPM Alpine

This image can run the Grav CMS with more power and more speed than a classic PHP configuration.

## How to get it ?

`docker pull dryusdan/php-grav`
or
`docker build -t dryusdan/php-grav https://github.com/Dryusdan/Dockerfiles.git#:php/grav`

## How to use it ?
```
docker run \
--name php-grav \
-v /mtn/docker/grav/web:/var/www/html:rw \
--restart always dryusdan/php-grav
```

## Heu...
Don't forgot configure your HTTP server ;) Exemple with nginx : 

```
server {
    listen   80;
    server_name  grav.localhost;
    index  index.php index.html index.htm;
    merge_slashes off;
    large_client_header_buffers 4 32k;
    root /grav;
    client_max_body_size 1G;


    location / {
        try_files $uri $uri/ /index.php?_url=$uri&$query_string;
    }
    ## End - Index

    ## Begin - Security
    # deny all direct access for these folders
    location ~* /(.git|cache|bin|logs|backup|tests)/.*$ { return 403; }
    # deny running scripts inside core system folders
    location ~* /(system|vendor)/.*\.(txt|xml|md|html|yaml|php|pl|py|cgi|twig|sh|bat)$ { return 403; }
    # deny running scripts inside user folder
    location ~* /user/.*\.(txt|md|yaml|php|pl|py|cgi|twig|sh|bat)$ { return 403; }
    # deny access to specific files in the root folder
    location ~ /(LICENSE.txt|composer.lock|composer.json|nginx.conf|web.config|htaccess.txt|\.htaccess) { return 403; }
    ## End - Security


    location ~ [^/]\.php(/|$) {
        #try_files $uri =404;
        fastcgi_split_path_info ^(.+?\.php)(/.*)$;
        fastcgi_pass php-grav:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_intercept_errors on;
        fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        internal;
    }

}
```