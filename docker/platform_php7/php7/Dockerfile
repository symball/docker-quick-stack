FROM alpine:3.5
MAINTAINER Simon Ball <simon.ball@pivot88.com>

RUN apk --update add \
  php7 \
  php7-bcmath \
  php7-dom \
  php7-ctype \
  php7-curl \
  php7-fpm \
  php7-gd \
  php7-gettext \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-ldap \
  php7-mbstring \
  php7-mcrypt \
  php7-mysqlnd \
  php7-opcache \
  php7-openssl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_sqlite \
  php7-phar \
  php7-posix \
  php7-session \
  php7-soap \
  php7-xml \
  php7-zip \
  php7-zlib \
  #
  # SUPPORT PACKAGES AND CLEANUP
  #
  autoconf \
  bash \
  ca-certificates \
  curl \
  git \
  libsasl \
  nodejs \
  openssh \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/*

# Symlink PHP7 to be runnable as php as opposed to needing to use php7
RUN ln -s /usr/bin/php7 /usr/bin/php

EXPOSE 9000

CMD ["php-fpm7", "-F"]
