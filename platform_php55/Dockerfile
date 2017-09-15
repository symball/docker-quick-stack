FROM ubuntu:14.04
MAINTAINER Simon Ball <open-source@simonball.me>

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apt-get update
RUN apt-get -y install \
  php5 \
  php5-fpm \
  php5-curl \
  php5-mysql \
  php5-gd \
  php5-mcrypt \
  php5-ldap


CMD ["/bin/bash"]
