#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=$(which brew 2> /dev/null || echo -n);
  if [ -z "$brew_cmd" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    brew_cmd=$(which brew 2> /dev/null || echo -n);
  fi

  if [ -n "$brew_cmd" ]; then
    $brew_cmd tap jzaleski/homebrew-jzaleski;

    alacritty_cask="alacritty";
    if $brew_cmd cask info $alacritty_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd cask install $alacritty_cask;
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
