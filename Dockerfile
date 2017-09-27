FROM alpine:latest

RUN apk --no-cache add \
      wget \
      curl \
      git \
      php5 \
      php5-curl \
      php5-intl \
      php5-json \
      php5-openssl \
      php5-pdo_mysql \
      php5-pdo_pgsql \
      php5-pdo_sqlite \
      php5-phar \
      php5-xml \
      php5-zlib \
      apache2 \
      php5-apache2 && \
    ln -s /usr/bin/php5 /usr/bin/php && \
    rm /var/www/localhost/htdocs/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir /run/apache2
COPY httpd-foreground /usr/local/bin/

EXPOSE 80

CMD ["httpd-foreground"]
