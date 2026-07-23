FROM caddy:2.11.4-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1.64 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
