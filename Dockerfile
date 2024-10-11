# syntax=docker/dockerfile:labs
FROM python:3.13.0-alpine3.20 AS certbot
COPY requirements.txt /tmp/requirements.txt
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates build-base libffi-dev && \
    python3 -m venv /usr/local && \
    pip install --no-cache-dir -r /tmp/requirements.txt

FROM scratch
COPY --from=certbot /usr/local /usr/local
