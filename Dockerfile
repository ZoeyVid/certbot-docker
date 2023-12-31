FROM python:3.12.1-alpine3.19 as certbot
ENV PATH="/usr/local/certbot/bin:$PATH"
RUN apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local/certbot && \
    pip install --no-cache-dir \
                               certbot==2.8.0 \
                               certbot-dns-cloudflare==2.8.0
# needs go                     certbot-dns-multi==4.14.2

FROM scratch
COPY --from=certbot /usr/local/certbot /usr/local/certbot
