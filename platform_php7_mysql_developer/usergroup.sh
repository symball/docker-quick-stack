#!/bin/bash

USER_ID=$1
GROUP_ID=$2

# Check if the platform group exists and configure accordingly
if grep -q "^:$GROUP_ID:" /etc/group
    then
         groupmod -n platform $GROUP_ID
    else
        if grep -q "platform" /etc/group; then
         echo "group exists"
       else
         addgroup -g $GROUP_ID platform
       fi
    fi

# Check whether the user exists and simply mod the ID if so
id -u php &>/dev/null || adduser -D -h /home/php -s /usr/bin/bash -G platform -u $USER_ID php
usermod -u $USER_ID -g $GROUP_ID php
