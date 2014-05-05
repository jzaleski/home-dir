#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  # ensure that "pip" is installed
  pip_cmd=`which pip`;
  if [ -z "$pip_cmd" ];
  then
    apt_get_cmd=`which apt-get`;
    if [ -n "$apt_get_cmd" ];
    then
      apt-get install -y python-pip;
    elif [ -n `which easy_install` ];
    then
      easy_install pip;
    else
      echo 'Could not install "pip"'
      exit 255;
    fi
    pip_cmd=`which pip`;
  fi

  # install base "egg(s)"
  for egg in \
    virtualenv;
  do
    $pip_cmd install $egg;
  done
fi
