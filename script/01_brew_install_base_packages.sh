#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ $(uname) = "Darwin" ]; then
  brew_cmd=$(which brew 2> /dev/null || echo -n);
  if [ -z "$brew_cmd" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
    brew_cmd=$(which brew 2> /dev/null || echo -n);
  fi

  if [ $(uname -p) = "arm" ]; then
    brew_cmd="arch -arm64 $brew_cmd";
  fi

  if [ -n "$brew_cmd" ]; then
    jzaleski_jzaleski_tap="jzaleski/jzaleski";
    if ! ${brew_cmd} tap | \grep ${jzaleski_jzaleski_tap} > /dev/null 2>&1; then
      ${brew_cmd} tap ${jzaleski_jzaleski_tap};
    fi

    iterm2_cask="iterm2";
    if $brew_cmd info --cask $iterm2_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd install --cask $iterm2_cask;
    fi

    for package in \
      ag \
      apg \
      bash \
      bash-completion \
      curl \
      git \
      gpg \
      htop \
      nvim \
      openssl \
      python \
      readline \
      screen \
      tmux \
      vim \
      wget \
      zsh;
    do
      package_details=$($brew_cmd list $package 2> /dev/null || echo -n);
      if [ -z "$package_details" ]; then
        $brew_cmd install $package;
      fi
    done
  fi
fi
