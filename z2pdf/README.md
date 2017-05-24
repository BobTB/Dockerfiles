# Docker image for z2pdf 

[![](https://images.microbadger.com/badges/image/dryusdan/z2pdf.svg)](https://microbadger.com/images/dryusdan/z2pdf "Get your own image badge on microbadger.com")

It's a docker image for z2pdf based on alpine.

## What is z2pdf ?
z2pdf is a zmarkdown converter for [zest-writer](https://github.com/firm1/zest-writer)

## How to get it ?
easier : `docker pull dryusdan/z2pdf`
or
`docker build -t dryusdan/z2pdf https://github.com/Dryusdan/Dockerfiles.git#:z2pdf`

## How to run it ?
Not complicated : 
```
docker run \
--name z2pdf \
--restart always -d dryusdan/z2pdf
```
