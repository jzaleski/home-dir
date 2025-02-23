#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  apt_cmd=$(which apt 2> /dev/null || echo -n);
  if [ -z "$apt_cmd" ]; then
    apt_cmd=$(which apt-get 2> /dev/null || echo -n);
  fi

  if [ -n "$apt_cmd" ]; then
    $apt_cmd update;

    $apt_cmd install -y \
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
      neovim \
      net-tools \
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
