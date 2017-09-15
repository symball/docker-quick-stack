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
  # Command line tools
  autoconf \
  bash \
  ca-certificates \
  curl \
  git \
  libsasl \
  nodejs \
  openssh \
  # EXTRA DEVELOPER TOOLS
  php7-xdebug \
  php7-xsl \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/* \
  && ln -s /usr/bin/php7 /usr/bin/php

# Enable xDebug
RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini

# Grab the latest Composer install
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer && \
  composer --version

# Copy across some of the utilities
COPY tools/pdepend /usr/local/bin/pdepend
COPY tools/phing /usr/local/bin/phing
COPY tools/phpcpd /usr/local/bin/phpcpd
COPY tools/phpdox /usr/local/bin/phpdox
COPY tools/phploc /usr/local/bin/phploc
COPY tools/phpmd /usr/local/bin/phpmd
COPY tools/phpunit /usr/local/bin/phpunit

# Output the versions os the above utilities
RUN chmod a+x -R /usr/local/bin && \
 phing -v && \
 phpcpd --version && \
 phpdox --version && \
 phploc --version && \
 phpmd --version && \
 phpunit --version

# GulpJS task runner
RUN npm i -g gulp bower && gulp -v && bower -v

# Generate the user group if it doesn't exist
COPY usergroup.sh /tmp/usergroup.sh
RUN sh /tmp/usergroup.sh $GROUP_ID

# Prepare a user and workspace
RUN mkdir -p /srv \
  && adduser -D -h /home/php -s /usr/bin/bash -G platform -u $USER_ID php \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R php:platform /var/log

USER php
WORKDIR /srv

CMD ["/bin/bash"]
