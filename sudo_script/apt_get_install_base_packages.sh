#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y \
      apg \
      automake \
      bash \
      bash-completion \
      bash-doc \
      build-essential \
      colordiff \
      curl \
      exuberant-ctags \
      git \
      htop \
      linux-headers-$(uname -r) \
      lsyncd \
      python \
      python-dev \
      python-setuptools \
      python-software-properties \
      screen \
      silversearcher-ag \
      subversion \
      tmux \
      unzip \
      uuid-dev \
      uuid-runtime \
      vim \
      wget \
      zsh \
      zsh-doc;
  fi
fi
