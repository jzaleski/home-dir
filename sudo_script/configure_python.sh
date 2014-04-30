#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  # ensure that "pip" is installed
  easy_install_cmd=`which easy_install`;
  pip_cmd=`which pip`;
  if [ -z "$pip_cmd" ];
  then
    if [ -n "$easy_install_cmd" ];
    then
      $easy_install_cmd pip;
    elif [ `uname -a` =~ 'Ubuntu' ];
    then
      apt-get install -y python-pip;
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
