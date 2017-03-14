# OnyxProject #
This is not official Onyx's image
Onyx is an assistant, accessible on any device

## Build image 
`docker build -t onyxproject https://git.dryusdan.fr/Dryusdan/Dockerfiles.git#master:onyxproject`

## Run image
`docker run --name onyxproject -v <your-data-storage-path>/home/onyx/Onyx/data onyxproject`

## Environnement variable 
`UID` User ID (default 991) [optionnal]  
`GID` Group ID (default 991) [optionnal]  
`SECRET_KEY` (default ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789)  
`SALT` (default ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789)  
`MAIL_SERVER` (not default) [optionnal]  
`MAIL_PORT` (default 465) [optionnal]  
`MAIL_USERNAME` (not default) [optionnal]  
`MAIL_PASSWORD` (not default) [optionnal]  
`MAIL_TLS` (default false) [optionnal]  
`MAIL_SSL` (default true) [optionnal]  
`REDIS_URL` (default localhost) [optionnal]  
`REDIS_PORT` (default 6379) [optionnal]  
`MEMCACHED_SERVER` (default 127.0.0.1:11211) [optionnal]  

## ROADMAP
After, it's could be good if we can choose build Onyx without redis and memcached