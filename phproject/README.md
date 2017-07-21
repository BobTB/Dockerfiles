# PHProject

[![](https://images.microbadger.com/badges/image/dryusdan/presentator.io.svg)](https://microbadger.com/images/dryusdan/presentator.io "Get your own image badge on microbadger.com")

Presentator.io is a web design presentation and collaboration platform. This image is based on xataz/nginx-php

## How to get it ?

`docker pull dryusdan/presentator.io`
or
`docker build -t dryusdan/presentator.io https://github.com/Dryusdan/Dockerfiles.git#:php/presentator`

## Configuration

### Environments

- UID=991 : Choose uid for launch presentator
- GID=991 : Choose gid for launch presentator
- PUBLIC_URL=app.presentator.io
- API_URI=api.presentator.io
- SALT=1234 
- API_SALT=1234 
- RECAPTCHA_KEY=1234 
- RECAPTCHA_SECRET=1234 
- NOREPLY_MAIL=no-reply@exemple.tld 
- SUPPORT_MAIL=support@exemple.tld 
- DB_HOST=localhost 
- DB_NAME=presentator 
- DB_USERNAME=presentator 
- DB_PASSWORD=1234 
- SMTP_HOST=smtp.exemple.tld 
- SMTP_USERNAME=no-reply@exemple.tld 
- SMTP_PASSWORD=14234 
- SMTP_PORT=465 
- SMTP_SSL=ssl


### Volumes
For persistance
- /presentator/app/web/assets 
- /presentator/app/web/uploads 
- /presentator/app/runtime 
- /presentator/api/runtime 

## Usage
```
docker run \
--name presentator \
-v /mtn/docker/presentator/app/web/assets:/presentator/app/web/assets \
-v /mtn/docker/presentator/app/web/uploads:/presentator/app/web/uploads \
-v /mtn/docker/presentator/app/runtime:/presentator/app/runtime \
-v /mtn/docker/presentator/api/runtime:/presentator/api/runtime \
--restart always dryusdan/presentator
```

## More info 
[Installation guide](https://github.com/ganigeorgiev/presentator/blob/master/docs/start-installation.md)
