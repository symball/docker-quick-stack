FROM symball/pivot88:toolchain_php5
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Prepare a user and workspace
RUN mkdir -p /srv \
  && addgroup -g $GROUP_ID platform \
  && adduser -D -h /home/php -s /usr/bin/bash -G platform -u $USER_ID php \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R php:platform /var/log

USER php
WORKDIR /srv

CMD ["/bin/bash"]
