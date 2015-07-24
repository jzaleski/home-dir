#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  easy_install_cmd=`\which easy_install 2> /dev/null`;

  # ensure that "pip" is installed
  pip_cmd=`\which pip 2> /dev/null`;
  if [ -z "$pip_cmd" ]; then
    if [ -n "$apt_get_cmd" ]; then
      $apt_get_cmd install -y python-pip;
    elif [ -n "$easy_install_cmd" ]; then
      $easy_install_cmd pip;
    fi
    pip_cmd=`\which pip 2> /dev/null`;
    if [ -z "$pip_cmd" ]; then
      echo "Could not install \"pip\"";
      exit 255;
    fi
  fi

  # ensure that "virtualenv" is installed
  virtualenv_cmd=`\which virtualenv 2> /dev/null`;
  if [ -z "$virtualenv_cmd" ]; then
    if [ -n "$apt_get_cmd" ]; then
      $apt_get_cmd install -y python-virtualenv;
    elif [ -n "$easy_install_cmd" ]; then
      $easy_install_cmd virtualenv;
    fi
    virtualenv_cmd=`\which virtualenv 2> /dev/null`;
    if [ -z "$virtualenv_cmd" ]; then
      echo "Could not install \"virtualenv\"";
      exit 255;
    fi
  fi
fi
