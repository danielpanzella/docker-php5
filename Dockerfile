FROM alpine:latest

RUN apk --no-cache add \
        php5 \
        php5-curl \
        php5-intl \
        php5-json \
        php5-pdo_mysql \
        php5-pdo_pgsql \
        php5-pdo_sqlite \
        php5-xml \
        apache2 \
        php5-apache2 && \
    rm /var/www/localhost/htdocs/*

RUN mkdir /run/apache2
COPY httpd-foreground /usr/local/bin/
CMD ["http-foreground"]
