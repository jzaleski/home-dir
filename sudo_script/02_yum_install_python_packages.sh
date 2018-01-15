#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      python \
      python-devel \
      python-pip \
      python-setuptools;
  fi
fi
