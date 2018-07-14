#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    $brew_cmd tap jzaleski/homebrew-jzaleski;

    for package in \
      ag \
      apg \
      bash \
      bash-completion \
      colordiff \
      coreutils \
      ctags \
      curl \
      emacs \
      fish \
      git \
      gnu-sed \
      gpg \
      htop \
      neovim \
      openssl \
      readline \
      screen \
      tmux \
      vim \
      wget \
      zsh \
      zsh-autosuggestions \
      zsh-syntax-highlighting;
    do
      package_details=`$brew_cmd list $package 2> /dev/null`;
      if [ -z "$package_details" ]; then
        $brew_cmd install $package;
      fi
    done
  fi
fi
