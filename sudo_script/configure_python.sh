#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    # install the required system-level packages
    $apt_get_cmd install -y \
      python \
      python-dev \
      python-pip \
      python-setuptools \
      python-software-properties \
      python-virtualenv;

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

    # install readline if it isn't already installed
    if [ `$pip_cmd freeze | \grep -c "[r]eadline"` -eq 0 ]; then
      $pip_cmd install readline;
    fi

    # verify the readline installation
    if [ `$pip_cmd freeze | \grep -c "[r]eadline"` -eq 0 ]; then
      echo "Could not install \"readline\"";
      exit 255;
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
fi
