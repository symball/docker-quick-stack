#!/bin/bash

USER_ID=$1
GROUP_ID=$2

# Check if the platform group exists and configure accordingly
if grep -q "^:$GROUP_ID:" /etc/group
    then
        echo "group found by ID, making sure correct"
         groupmod -n $GROUP_ID nginx
    else
        if grep -q "nginx" /etc/group; then
         echo "group exists"
       else
         addgroup -g $GROUP_ID nginx
       fi
    fi

# Check whether the user exists and simply mod the ID if so
id -u nginx &>/dev/null || adduser -D -h /var/cache/nginx -s /usr/bin/bash -G nginx -u $USER_ID nginx
usermod -u $USER_ID -g nginx nginx
