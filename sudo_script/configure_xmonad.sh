#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  apt_cmd=`which apt-get`;
  if [ -n "$apt_cmd" ];
  then
    # Install packages
    $apt_cmd install -y \
      autocutsel \
      slim \
      xmonad \
      xorg;
    # Ensure that "gdm" is not started by default
    if [ -n `which gdm` ];
    then
      update-rc.d -f gdm remove 2> /dev/null;
    fi
    # Ensure that "lightdm" is not started by default
    if [ -n `which lightdm` ];
    then
      (echo "manual" >> /etc/init/lightdm.override) 2> /dev/null;
    fi
    # Ensure that "slim" is not started by default
    if [ -n `which slim` ];
    then
      update-rc.d -f slim remove 2> /dev/null;
    fi
  fi
fi
