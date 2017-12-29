#!/bin/bash

USER_ID=$1
GROUP_ID=$2

# Check if the platform group exists and configure accordingly
if grep -q "^:$GROUP_ID:" /etc/group
    then
        echo "Modifying the group name"
         groupmod -n platform $GROUP_ID
    else
        if grep -q "platform" /etc/group; then
         echo "group exists"
       else
         echo "Adding the group"
         addgroup --gid $GROUP_ID platform
       fi
    fi

# Check whether the user exists and simply mod the ID if so
id -u php &>/dev/null || adduser --disabled-password --home /home/php --shell /usr/bin/bash --ingroup platform --uid $USER_ID php
usermod -u $USER_ID -g platform php
