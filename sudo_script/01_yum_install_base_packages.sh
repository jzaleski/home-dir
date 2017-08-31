#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd groupinstall -y "Development Tools";

    $yum_cmd install -y \
      apg \
      automake \
      bash \
      bash-completion \
      colordiff \
      ctags-etags \
      curl \
      dkms \
      epel-release \
      gcc \
      git \
      htop \
      kernel-devel-$(uname -r) \
      net-tools \
      readline \
      screen \
      the_silver_searcher \
      tmux \
      uuid \
      uuid-devel \
      vim-enhanced \
      wget \
      zsh;
  fi
fi
