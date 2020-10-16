#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=$(which brew 2> /dev/null || echo -n);
  if [ -z "$brew_cmd" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
    brew_cmd=$(which brew 2> /dev/null || echo -n);
  fi

  if [ -n "$brew_cmd" ]; then
    $brew_cmd tap jzaleski/jzaleski;

    alacritty_cask="alacritty";
    if $brew_cmd cask info $alacritty_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd cask install $alacritty_cask;
    fi

    iterm2_cask="iterm2";
    if $brew_cmd cask info $iterm2_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd cask install $iterm2_cask;
    fi

    middleclick_cask="middleclick";
    if $brew_cmd cask info $middleclick_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd cask install $middleclick_cask;
    fi

    for package in \
      ag \
      apg \
      bash \
      bash-completion \
      colordiff \
      coreutils \
      ctags \
      curl \
      fish \
      git \
      gnu-sed \
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
      zsh \
      zsh-autosuggestions \
      zsh-syntax-highlighting;
    do
      package_details=$($brew_cmd list $package 2> /dev/null || echo -n);
      if [ -z "$package_details" ]; then
        $brew_cmd install $package;
      fi
    done
  fi
fi
