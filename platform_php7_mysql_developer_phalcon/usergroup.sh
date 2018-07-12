#!/bin/bash

USER_ID=$1
GROUP_ID=$2

if [ -z "$3" ]
    then
        USER_NAME="developermode"
else
    USER_NAME=$3
fi

if [ -z "$4" ]
    then
        GROUP_NAME="$USER_NAME"
else
    GROUP_NAME=$4
fi

if [ -z "$5" ]
    then
        USER_HOME="/home/$USER_NAME"
else
    USER_HOME=$5
fi

if grep -q "^:$GROUP_ID:" /etc/group
    then
        echo "group found by ID, making sure correct"
         groupmod -n $GROUP_ID $GROUP_NAME
    else
        if grep -q "$GROUP_NAME" /etc/group; then
         echo "group exists"
       else
         addgroup -g $GROUP_ID $GROUP_NAME
       fi
    fi

# Check whether the user exists and simply mod the ID if so
id -u $USER_NAME &>/dev/null || adduser -D -h $USER_HOME -s /usr/bin/bash -G $GROUP_NAME -u $USER_ID $USER_NAME
usermod -u $USER_ID -g $GROUP_NAME $USER_NAME
