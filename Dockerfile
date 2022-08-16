# syntax=docker/dockerfile:1.4
# https://hub.docker.com/_/alpine/tags?page=1&name=latest
FROM docker.io/alpine@sha256:1304f174557314a7ed9eddb4eab12fed12cb0cd9809e4c28f29af86979a3c870

RUN apk update && \
apk upgrade && \
apk add bash && \
apk add headscale --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
rm -rf /var/cache/apk/*

COPY config.yaml /etc/headscale/config.yaml

ENV TZ UTC

EXPOSE 8080/tcp
EXPOSE 9090/tcp
EXPOSE 50443/tcp
EXPOSE 3478/udp

CMD ["headscale", "serve"]
