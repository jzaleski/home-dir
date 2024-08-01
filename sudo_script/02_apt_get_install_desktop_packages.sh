#!/usr/bin/env bash

if [ -n "$BOOTSTRAP_DESKTOP_ENVIRONMENT" ]; then
  apt_get_cmd=$(which apt-get 2> /dev/null || echo -n);
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd update;

    $apt_get_cmd install -y \
      autocutsel \
      fontconfig;
  fi
fi
