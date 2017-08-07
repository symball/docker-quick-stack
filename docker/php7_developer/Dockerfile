FROM alpine:3.5
MAINTAINER Simon Ball <simon.ball@pivot88.com>

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
  nodejs \
  openssh \
  && ssh-keygen -A \
  && rm -rf /var/cache/apk/*

# Symlink PHP7 to be runnable as php as opposed to needing to use php7
RUN ln -s /usr/bin/php7 /usr/bin/php

# Enable xDebug
RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini

# Grab the latest Composer install
RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer && \
  composer --version

# Copy across some of the utilities
COPY pdepend /usr/local/bin/pdepend
COPY phing /usr/local/bin/phing
COPY phpcpd /usr/local/bin/phpcpd
COPY phpdox /usr/local/bin/phpdox
COPY phploc /usr/local/bin/phploc
COPY phpmd /usr/local/bin/phpmd
COPY phpunit /usr/local/bin/phpunit

# Output the versions os the above utilities
RUN pdepend --version && \
 phing -v && \
 phpcpd --version && \
 phpdox --version && \
 phploc --version && \
 phpmd --version && \
 phpunit --version

# GulpJS task runner
RUN npm install gulp -g && gulp -v
# bower package manager
RUN npm install bower -g && bower -v

CMD ["/bin/bash"]
