FROM python:3.12.0-alpine3.18
ENV PATH="/usr/local/certbot/bin:$PATH"
RUN apk add --no-cache ca-certificates build-base libffi-dev go && \
    python3 -m venv /usr/local/certbot && \
    pip install --no-cache-dir certbot \
                               \
                               certbot-dns-cloudflare \
                               certbot-dns-digitalocean \
#                               certbot-dns-dnsimple \
#                               certbot-dns-dnsmadeeasy \
#                               certbot-dns-gehirn \
                               certbot-dns-google \
                               certbot-dns-linode \
#                               certbot-dns-luadns \
#                               certbot-dns-nsone \
                               certbot-dns-ovh \
                               certbot-dns-rfc2136 \
#                               certbot-dns-route53 \
#                               certbot-dns-sakuracloud \
                               \
                               certbot-dns-multi
                               
