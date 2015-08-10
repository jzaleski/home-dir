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
      freetds-bin \
      freetds-common \
      freetds-dev \
      htop \
      libntlm0 \
      libntlm0-dev \
      linux-headers-$(uname -r) \
      lsyncd \
      pidgin \
      pidgin-dev \
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
