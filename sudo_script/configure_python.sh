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
fi
