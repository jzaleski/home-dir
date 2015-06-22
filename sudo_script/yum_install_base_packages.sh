#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      apg \
      automake \
      bash \
      bash-completion \
      bash-doc \
      ctags-etags \
      git \
      htop \
      python \
      python-devel \
      python-setuptools \
      readline-devel \
      screen \
      unzip \
      uuid \
      uuid-devel \
      vim \
      wget \
      zsh;
  fi
fi
