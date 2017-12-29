FROM nginx:mainline-alpine

MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apk --update add \
  shadow

# Generate the user group if it doesn't exist
COPY usergroup.sh /usr/local/bin/usergroupmatch
RUN chmod a+x -R /usr/local/bin
RUN sh /usr/local/bin/usergroupmatch $USER_ID $GROUP_ID

RUN chown -R nginx:nginx /var/run
USER nginx

CMD ["nginx", "-g", "daemon off;"]