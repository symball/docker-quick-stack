FROM symball/pivot88:platform_php7

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

# Prepare a user and workspace
RUN mkdir -p /srv
RUN addgroup -g $GROUP_ID www-data
RUN adduser -D -h /srv -s /usr/bin/bash -G www-data -u $USER_ID www-data
RUN chmod -R 775 /srv
RUN chown -R www-data:www-data /srv

USER www-data
WORKDIR /srv

CMD ["php-fpm7", "-F"]
