#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  # install packages
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
      tmux \
      vim \
      wget \
      zsh;
  fi
  # install "ag" (if it isn't already present)
  ag_cmd=`which ag`;
  if [ -z "$ag_cmd" ];
  then
    (
      cd /tmp &&
      git clone git://github.com/ggreer/the_silver_searcher.git
      cd the_silver_searcher &&
      sh build.sh &&
      make install &&
      cd .. &&
      rm -rf the_silver_searcher;
    );
  fi
fi
