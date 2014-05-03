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
      lightdm \
      stalonetray \
      x11-apps \
      x11-common \
      x11-utils \
      xcompmgr \
      xmobar \
      xmonad \
      xserver-xorg \
      xserver-xorg-dev;
    # Ensure that "lightdm" is not started by default
    if [ -n `which lightdm` ];
    then
      update-rc.d -f lightdm remove;
    fi
  fi
fi
