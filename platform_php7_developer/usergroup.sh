#!/bin/bash

GROUP_ID=$1
cat /etc/group
if grep -q "^:$GROUP_ID:" /etc/group
    then
         echo "group exits"
         groupmod -n platform $GROUP_ID
    else
        if grep -q "platform" /etc/group; then
         echo "group exists"
       else
         addgroup -g $GROUP_ID platform
       fi
    fi
