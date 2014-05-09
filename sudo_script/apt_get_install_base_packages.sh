#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  apt_get_cmd=`which apt-get`;
  if [ -n "$apt_get_cmd" ];
  then
    $apt_get_cmd install -y \
      apg \
      automake \
      bash-completion \
      build-essential \
      exuberant-ctags \
      git \
      htop \
      linux-headers-$(uname -r) \
      screen \
      uuid-dev \
      uuid-runtime \
      vim \
      wget \
      zsh;
  fi
fi
