#!/bin/bash

HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ];
then
  for package in \
    ag \
    apg \
    bash-completion \
    ctags \
    git \
    htop-osx \
    openssl \
    readline \
    tmux \
    vim \
    wget \
    zsh \
    zsh-completions;
  do
    PACKAGE_DETAILS=`brew list $package 2> /dev/null`;
    if [ -z "$PACKAGE_DETAILS" ];
    then
      brew install $package;
    fi
  done
fi
