#!/bin/bash
#!/
#!/# Author Simon Ball <contact@simonball.me>
# This is just a quick shell script to bootstrap Docker Symfony projects

# Function to check whether command exists or not
exists()
{
  if command -v $1 &>/dev/null
  then
    return 0
  else
    return 1
    fi
}

# Start by checking whether docker and docker-compose exist
echo "###########################################"
echo "### Checking whether needed tools found ###"
echo "###########################################"
if exists docker
  then echo "Docker found"
  else echo "Docker not found, exiting"
  exit
fi

if exists docker-compose
  then echo "Docker-compose found"
  else echo "Docker-compose not found, exiting"
  exit
fi

# on Mac, primary group on mac will already be in use
if [[ "$OSTYPE" == "darwin17" ]]; then
  echo "recognise using a mac"
   GROUP_ID=$(python -c 'import grp; print grp.getgrnam("shared_volume").gr_gid')
else
   GROUP_ID=$(id -g)
fi

# Try and get the user ID
USER_ID=$UID
id_command='id -u'
[ -z "$USER_ID" ] && USER_ID=$(id -u)

# Try and use the script parameter if one exists
[ -z "$USER_ID" ] && [ "$1" ] && USER_ID=$1

if [ -z "$USER_ID" ]
then
  echo "Could not get User ID"
  echo "Try finding your uid by running 'id' and relaunch this script appending the number on the end."
  echo "e.g - sh initial.sh 1000"
  exit
fi

echo "USER_NAME=$(id -un)" > .env
echo "USER_ID=$USER_ID" >> .env
echo "GROUP_ID=$GROUP_ID" >> .env
