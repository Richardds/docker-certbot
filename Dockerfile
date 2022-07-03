ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

LABEL org.opencontainers.image.title 'Certbot'
LABEL org.opencontainers.image.description 'Certbot with Cloudflare DNS plugin'
LABEL org.opencontainers.image.authors 'Richard Boldiš <richard@boldis.dev>'
LABEL org.opencontainers.image.source https://github.com/Richardds/docker-certbot

#
# Packages
#

# Install certbot and Cloudflare DNS plugin
RUN apk add --no-cache --update certbot python3 py3-pip \
 && pip install certbot-dns-cloudflare \
 && apk del py3-pip \
 && rm -rf /var/cache/apk/*

WORKDIR /etc/letsencrypt

#
# Entrypoint
#

ENTRYPOINT [ "/usr/bin/certbot" ]
