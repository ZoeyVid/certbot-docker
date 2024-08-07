# syntax=docker/dockerfile:labs
FROM python:3.12.5-alpine3.20 AS certbot
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local && \
    pip install --no-cache-dir certbot==2.11.0

FROM scratch
COPY --from=certbot /usr/local /usr/local
