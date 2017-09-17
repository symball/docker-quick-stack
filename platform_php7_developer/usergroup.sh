#!/bin/bash

GROUP_ID=$1

if grep -q "^:$GROUP_ID:" /etc/group
    then
         echo "group exits"
         groupmod -n platform $GROUP_ID
    else
         echo "group not exits"
         addgroup -g $GROUP_ID platform
    fi
