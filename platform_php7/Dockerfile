FROM alpine:3.5
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

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
  php7-xdebug \
  php7-xml \
  php7-zip \
  php7-zlib \
  # Command line tools
  autoconf \
  bash \
  ca-certificates \
  curl \
  git \
  libsasl \
  openssh \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/* \
  && ln -s /usr/bin/php7 /usr/bin/php

  # Generate the user group if it doesn't exist
  COPY usergroup.sh /tmp/usergroup.sh
  RUN sh /tmp/usergroup.sh $GROUP_ID


# Prepare a user and workspace
RUN mkdir -p /srv \
  && adduser -D -h /home/phpdaemon -s /usr/bin/bash -G platform -u $USER_ID phpdaemon \
  && chmod -R 775 /srv \
  && chown -R phpdaemon:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R phpdaemon:platform /var/log \
  && chmod -R 775 /var/log/php7

USER phpdaemon
WORKDIR /srv

CMD ["php-fpm7", "-F"]
