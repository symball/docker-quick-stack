FROM symball/docker-images:platform_php7_mongo
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=developermode
ARG GROUP_NAME=developermode

# Optionally change home path. include as extra parameter on usergroupmatch
# ARG USER_HOME=/home/developermode

USER root

RUN apk --update add \
    shadow \
    php7-xdebug

RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini

COPY usergroup.sh /usr/local/bin/usergroupmatch
RUN chmod a+x -R /usr/local/bin
# Generate the user group if it doesn't exist
RUN usergroupmatch $USER_ID $GROUP_ID $USER_NAME $USER_GROUP

# Prepare a workspace
RUN mkdir -p /srv \
  && chmod -R 775 /srv \
  && chown -R $USER_NAME:$USER_GROUP /srv \
  && mkdir -p /var/log/php7 \
  && chown -R $USER_NAME:$USER_GROUP /var/log \
  && chmod -R 775 /var/log/php7

USER $USER_NAME
WORKDIR /srv

CMD ["php-fpm7", "-F"]
