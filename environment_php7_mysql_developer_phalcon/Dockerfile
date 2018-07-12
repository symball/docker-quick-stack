FROM symball/docker-images:environment_php7_mysql_developer_phalcon
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=developermode
ARG GROUP_NAME=developermode

# Optionally change home path. include as extra parameter on usergroupmatch
# ARG USER_HOME=/home/developermode

USER root

# Generate the user group if it doesn't exist
RUN usergroupmatch $USER_ID $GROUP_ID $USER_NAME $USER_GROUP

# Prepare a user and workspace
RUN mkdir -p /srv \
  && chmod -R 775 /srv \
  && chown -R $USER_NAME:$USER_GROUP /srv \
  && mkdir -p /var/log/php7 \
  && chown -R $USER_NAME:$USER_GROUP /var/log \
  && chmod -R 775 /var/log/php7

USER $USER_NAME

# Install composer plugin for parallel downloads
RUN composer global require hirak/prestissimo

WORKDIR /srv

CMD ["/bin/bash"]
