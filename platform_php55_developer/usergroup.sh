#!/bin/bash

GROUP_ID=$1
if grep -q "platform" /etc/group; then
     echo "group exists"
     groupmod -g $GROUP_ID platform
else
    addgroup --gid $GROUP_ID platform
fi
