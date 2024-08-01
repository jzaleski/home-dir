#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_get_cmd=$(which apt-get 2> /dev/null || echo -n);
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd update;

    $apt_get_cmd install -y \
      apg \
      automake \
      bash \
      bash-completion \
      build-essential \
      curl \
      git \
      htop \
      libbz2-dev \
      libffi-dev \
      liblzma-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libyaml-dev \
      locales \
      screen \
      silversearcher-ag \
      tk-dev \
      tmux \
      unzip \
      uuid-dev \
      uuid-runtime \
      vim \
      wget \
      zlib1g-dev \
      zsh;
  fi
fi
