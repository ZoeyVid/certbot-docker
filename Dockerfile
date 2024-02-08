FROM python:3.12.2-alpine3.19 as certbot
RUN apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local && \
    pip install --no-cache-dir \
                               certbot==2.9.0 \
                               certbot-dns-cloudflare==2.9.0
# needs go                     certbot-dns-multi==4.15.0

FROM scratch
COPY --from=certbot /usr/local /usr/local
