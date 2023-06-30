# syntax=docker/dockerfile:1.4
# https://hub.docker.com/_/alpine/tags
FROM docker.io/alpine@sha256:e2e16842c9b54d985bf1ef9242a313f36b856181f188de21313820e177002501

RUN apk update && \
apk upgrade && \
apk add caddy && \
rm -rf /var/cache/apk/*

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 8080/tcp

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
