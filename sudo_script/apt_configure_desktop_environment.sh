#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    # Install packages
    $apt_get_cmd install -y \
      autocutsel \
      firefox \
      gnome-terminal \
      xmonad;
  fi
fi
