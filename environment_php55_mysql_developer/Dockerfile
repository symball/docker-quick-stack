FROM symball/docker-images:base_php55_developer
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Generate the user group if it doesn't exist
COPY usergroup.sh /usr/local/bin/usergroupmatch
RUN chmod a+x /usr/local/bin/usergroupmatch

RUN usergroupmatch $USER_ID $GROUP_ID

  # Prepare a user and workspace
  RUN mkdir -p /srv \
    && chmod -R 775 /srv \
    && chown -R php:platform /srv \
    && mkdir -p /var/log/php \
    && chown -R php:platform /var/log \
    && chmod -R 775 /var/log/php

USER php

# Install composer plugin for parallel downloads
RUN composer global require hirak/prestissimo

WORKDIR /srv

CMD ["/bin/bash"]
