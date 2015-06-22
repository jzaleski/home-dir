#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  # ensure that "pip" is installed
  pip_cmd=`\which pip 2> /dev/null`;
  if [ -z "$pip_cmd" ]; then
    apt_get_cmd=`\which apt-get 2> /dev/null`;
    if [ -n "$apt_get_cmd" ]; then
      apt-get install -y python-pip;
    elif [ -n `\which easy_install 2> /dev/null` ]; then
      easy_install pip;
    else
      echo "Could not install \"pip\"";
      exit 255;
    fi
    pip_cmd=`\which pip`;
  fi
  # install base "egg(s)"
  $pip_cmd install virtualenv;
fi
