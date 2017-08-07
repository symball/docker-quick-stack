FROM alpine:3.5
MAINTAINER Simon Ball <simon.ball@pivot88.com>

RUN apk --update add \
  php5 \
  php5-bcmath \
  php5-dom \
  php5-ctype \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-gettext \
  php5-iconv \
  php5-intl \
  php5-json \
  php5-ldap \
  php5-mcrypt \
  php5-mysqli \
  php5-opcache \
  php5-openssl \
  php5-pdo \
  php5-pdo_mysql \
  php5-pdo_sqlite \
  php5-phar \
  php5-posix \
  php5-soap \
  php5-xml \
  php5-xsl \
  php5-zip \
  php5-zlib \
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

EXPOSE 9000

CMD ["php-fpm", "-F"]
