# Builder image
FROM docker.io/golang:1.20-alpine AS build
ARG VERSION=v0.22.3
ENV GOPATH /go

RUN apk add --no-cache binutils git

RUN git clone --depth=1 -b $VERSION https://github.com/juanfont/headscale.git /go/src/headscale

WORKDIR /go/src/headscale

RUN CGO_ENABLED=0 GOOS=linux go install -ldflags="-s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=$VERSION" -a ./cmd/headscale
RUN strip /go/bin/headscale
RUN test -e /go/bin/headscale

# Production image
FROM alpine:3.18

RUN apk add --no-cache bash

COPY --from=build /go/bin/headscale /bin/headscale
ENV TZ UTC

COPY config.yaml /etc/headscale/config.yaml

EXPOSE 8080/tcp
CMD ["headscale", "serve"]
