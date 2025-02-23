#!/usr/bin/env bash

if [ -n "$BOOTSTRAP_DESKTOP_ENVIRONMENT" ]; then
  apt_cmd=$(which apt 2> /dev/null || echo -n);
  if [ -z "$apt_cmd" ]; then
    apt_cmd=$(which apt-get 2> /dev/null || echo -n);
  fi

  if [ -n "$apt_cmd" ]; then
    $apt_cmd update;

    $apt_cmd install -y \
      autocutsel \
      fontconfig;
  fi
fi
