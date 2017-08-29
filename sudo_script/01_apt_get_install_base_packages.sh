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
      dkms \
      exuberant-ctags \
      git \
      htop \
      libntlm0 \
      libntlm0-dev \
      linux-headers-$(uname -r) \
      screen \
      tdsodbc \
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
