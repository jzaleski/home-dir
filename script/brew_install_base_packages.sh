#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    for package in \
      ag \
      apg \
      bash \
      bash-completion \
      ctags \
      git \
      gnu-sed \
      gpg \
      htop-osx \
      jq \
      openssl \
      readline \
      tmux \
      vim \
      wget \
      zsh \
      zsh-completions;
    do
      package_details=`$brew_cmd list $package 2> /dev/null`;
      if [ -z "$package_details" ]; then
        $brew_cmd install $package;
      fi
    done
  fi
fi
