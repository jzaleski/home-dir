#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y \
      apg \
      automake \
      bash \
      bash-completion \
      build-essential \
      colordiff \
      curl \
      dkms \
      exuberant-ctags \
      git \
      htop \
      linux-headers-$(uname -r) \
      readline \
      screen \
      the_silver_searcher \
      tmux \
      uuid-dev \
      uuid-runtime \
      vim \
      wget \
      zsh \
      zshcompsys;
  fi
fi
