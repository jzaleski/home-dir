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
      emacs \
      exuberant-ctags \
      fish \
      git \
      htop \
      libreadline-dev \
      screen \
      silversearcher-ag \
      tmux \
      uuid-dev \
      uuid-runtime \
      vim \
      wget \
      zsh;
  fi
fi
