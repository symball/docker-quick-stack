FROM nginx:mainline-alpine

MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=nginx
ARG GROUP_NAME=nginx
ARG USER_HOME=/var/cache/nginx

USER root

RUN apk --update add \
  shadow

# Generate the user group if it doesn't exist
COPY usergroup.sh /usr/local/bin/usergroup
RUN sh /usr/local/bin/usergroup $USER_ID $GROUP_ID $USER_NAME $GROUP_NAME $USER_HOME

RUN chown -R $USER_NAME:$USER_GROUP /var/run
USER $USER_NAME

CMD ["nginx", "-g", "daemon off;"]
