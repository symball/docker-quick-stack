FROM symball/docker-images:environment_php7_mongo_developer
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Generate the user group if it doesn't exist
RUN usergroupmatch $USER_ID $GROUP_ID

# Prepare a user and workspace
RUN mkdir -p /srv \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R php:platform /var/log \
  && chmod -R 775 /var/log/php7

USER php

# Install composer plugin for parallel downloads
RUN composer global require hirak/prestissimo

WORKDIR /srv

CMD ["/bin/bash"]
