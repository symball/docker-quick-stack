FROM ubuntu:14.04
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apt-get update
RUN apt-get -y install \
  php5 \
  php5-curl \
  php5-mysql \
  php5-gd \
  php5-mcrypt \
  php5-ldap \
  php5-xsl \
  curl \
  git \
  # EXTRA TOOLS
  nodejs \
  npm \
  openssh-client

  # Grab the latest Composer install
  RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin \
    --filename=composer && \
    composer --version

  # Copy across some of the utilities
  COPY tools/pdepend /usr/local/bin/pdepend
  COPY tools/phing /usr/local/bin/phing
  COPY tools/phpdox /usr/local/bin/phpdox
  COPY tools/phploc /usr/local/bin/phploc
  COPY tools/phpmd /usr/local/bin/phpmd
  COPY tools/phpunit /usr/local/bin/phpunit

  # Output the versions os the above utilities
  RUN chmod a+x -R /usr/local/bin && \
   pdepend --version && \
   phing -v && \
   phpdox --version && \
   phploc --version && \
   phpmd --version && \
   phpunit --version

  # GulpJS task runner
  RUN npm i -g gulp bower && gulp -v && bower -v

# Prepare a user and workspace
RUN mkdir -p /srv \
  && addgroup --gid $GROUP_ID platform \
  && useradd -d /home/php -s /usr/bin/bash -g platform -u $USER_ID php \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R php:platform /var/log

USER php
WORKDIR /srv

CMD ["/bin/bash"]
