#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  apt_cmd=`which apt-get`;
  if [ -n "$apt_cmd" ];
  then
    # Install packages
    $apt_cmd install -y \
      libghc-xmonad-contrib-dev \
      libghc-xmonad-dev \
      moreutils \
      slim \
      stalonetray \
      x11-apps \
      x11-common \
      x11-utils \
      xcompmgr \
      xmobar \
      xmonad \
      xserver-xorg \
      xserver-xorg-dev;
    # Ensure that "slim" is not started by default
    if [ -n `which slim` ];
    then
      update-rc.d -f slim remove;
    fi
  fi
fi
