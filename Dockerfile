ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG CERTBOT_VERSION
ARG CERTBOT_CLOUDFLARE_VERSION

LABEL org.opencontainers.image.title 'Certbot'
LABEL org.opencontainers.image.description 'Certbot with Cloudflare DNS plugin'
LABEL org.opencontainers.image.authors 'Richard Boldiš <richard@boldis.dev>'
LABEL org.opencontainers.image.source https://github.com/Richardds/docker-certbot

#
# Packages
#

# Install certbot and Cloudflare DNS plugin
RUN apk add --no-cache --update "certbot=~${CERTBOT_VERSION}" python3=~3.10 py3-pip=~22.3 \
 && pip install --no-cache-dir "certbot-dns-cloudflare==${CERTBOT_CLOUDFLARE_VERSION}" \
 && apk del py3-pip \
 && rm -rf /var/cache/apk/*

WORKDIR /etc/letsencrypt

#
# Entrypoint
#

ENTRYPOINT [ "/usr/bin/certbot" ]
