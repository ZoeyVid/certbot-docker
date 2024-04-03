FROM python:3.12.2-alpine3.19 as certbot
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local && \
    pip install --no-cache-dir \
                               certbot==2.10.0 \
                               certbot-dns-cloudflare==2.10.0
# needs go                     certbot-dns-multi==4.16.1

FROM scratch
COPY --from=certbot /usr/local /usr/local
