FROM php:8.1-fpm-alpine AS PHP

RUN apk add --no-cache \
       zlib-dev \
       libpng-dev \
       libzip-dev \
    && docker-php-ext-install gd zip

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY . /app

# Do not recommend 777 for production but works well for demo
RUN chmod -R 777 /app

FROM alpine:3.16 AS CONFIG

ARG FPM_LOCATION=app
ARG FPM_PORT=9000

RUN apk add --no-cache gettext

COPY ./docker/caddy/Caddyfile /tmp/Caddyfile

ENV FPM_LOCATION=${FPM_LOCATION}
ENV FPM_PORT=${FPM_PORT}

RUN envsubst < /tmp/Caddyfile > /tmp/processedCaddyfile

FROM caddy:2.6 AS CADDY

COPY --from=PHP /app /app
COPY --from=CONFIG /tmp/processedCaddyfile /etc/caddy/Caddyfile
