FROM symball/pivot88-docker:base_php55_developer
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Generate the user group if it doesn't exist
COPY usergroup.sh /tmp/usergroup.sh
RUN sh /tmp/usergroup.sh $GROUP_ID

# Prepare a user and workspace
RUN mkdir -p /srv && mkdir -p /var/log \
  && useradd -m -d /home/php -s /usr/bin/bash -g platform -u $USER_ID php \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && chown -R php:platform /var/log

USER php

# Install composer plugin for parallel downloads
RUN composer global require hirak/prestissimo

WORKDIR /srv

CMD ["/bin/bash"]
