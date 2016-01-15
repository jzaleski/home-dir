#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y \
      python \
      python-dev \
      python-pip \
      python-setuptools \
      python-software-properties \
      python-virtualenv;
  fi

  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      python \
      python-devel \
      python-pip \
      python-setuptools \
      python-virtualenv;
  fi

  if [ -z "$apt_get_cmd" ] && [ -z "$yum_cmd" ]; then
    echo "Could not configure \"python\"";
    exit 1;
  fi

  # ensure that pip is available
  pip_cmd=`\which pip 2> /dev/null`;
  if [ -z "$pip_cmd" ]; then
    echo "Could not locate the \"pip\" binary";
    exit 1;
  fi

  # ensure that virtualenv is available
  virtualenv_cmd=`\which virtualenv 2> /dev/null`;
  if [ -z "$virtualenv_cmd" ]; then
    echo "Could not locate the \"virtualenv\" binary";
    exit 1;
  fi

  # install ipython if it isn't already installed
  if [ -z `\which ipython 2> /dev/null` ]; then
    $pip_cmd install ipython;
  fi

  # verify the ipython installation
  if [ -z `\which ipython 2> /dev/null` ]; then
    echo "Could not install \"ipython\"";
    exit 255;
  fi
fi
