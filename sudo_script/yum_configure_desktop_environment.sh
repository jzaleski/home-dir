#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    # Install packages
    $yum_cmd install -y \
      firefox \
      gnome-terminal \
      xorg-x11-server-Xorg \
      xorg-x11-xinit-session;
  fi
fi