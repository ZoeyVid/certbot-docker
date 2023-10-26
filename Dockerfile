FROM python:3.12.0-alpine3.18 as certbot
ENV PATH="/usr/local/certbot/bin:$PATH"
RUN apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local/certbot && \
    pip install --no-cache-dir \
                               certbot==2.7.3 \
                               certbot-dns-cloudflare==2.7.3
#                               certbot-dns-multi==4.14.2 # needs go

FROM scratch
COPY --from=certbot /usr/local/certbot /usr/local/certbot
