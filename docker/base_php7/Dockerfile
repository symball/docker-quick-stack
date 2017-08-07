FROM alpine:3.5
MAINTAINER Simon Ball <open-source@simonball.me>

ENV PHING_VERSION="2.15.2"
# Add more tools

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Prepare a user and workspace
RUN mkdir -p /srv
RUN addgroup -g $GROUP_ID php7
RUN adduser -D -h /srv -s /usr/bin/bash -G php7 -u $USER_ID php7
RUN chmod -R 775 /srv
RUN chown -R php7:php7 /srv

USER php7
WORKDIR /srv

CMD ["/bin/bash"]
