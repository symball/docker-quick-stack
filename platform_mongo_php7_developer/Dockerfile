FROM symball/docker-images:platform_php7
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apk --update add shadow

COPY usergroup.sh /usr/local/bin/usergroupmatch
RUN chmod a+x -R /usr/local/bin

# Generate the user group if it doesn't exist
RUN sh usergroupmatch $USER_ID $GROUP_ID

# Prepare a workspace
RUN mkdir -p /srv \
  && chmod -R 775 /srv \
  && chown -R php:platform /srv \
  && mkdir -p /var/log/php7 \
  && chown -R php:platform /var/log \
  && chmod -R 775 /var/log/php7

USER php
WORKDIR /srv

CMD ["php-fpm7", "-F"]
