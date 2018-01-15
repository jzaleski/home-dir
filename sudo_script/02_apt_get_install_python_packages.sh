#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y \
      python \
      python-dev \
      python-pip \
      python-setuptools;
  fi
fi
