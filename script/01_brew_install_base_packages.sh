#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ $(uname) = "Darwin" ]; then
  brew_cmd=$(which brew 2> /dev/null || echo -n);
  if [ -z "$brew_cmd" ]; then
    for candidate in /opt/homebrew/bin/brew /usr/local/bin/brew; do
      if [ -x "$candidate" ]; then
        brew_cmd="$candidate";
        break;
      fi
    done
  fi

  if [ -z "$brew_cmd" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    brew_cmd=$(which brew 2> /dev/null || echo -n);
    if [ -z "$brew_cmd" ]; then
      for candidate in /opt/homebrew/bin/brew /usr/local/bin/brew; do
        if [ -x "$candidate" ]; then
          brew_cmd="$candidate";
          break;
        fi
      done
    fi
  fi

  if [ $(uname -p) = "arm" ]; then
    brew_cmd="arch -arm64 $brew_cmd";
  fi

  if [ -n "$brew_cmd" ]; then
    jzaleski_jzaleski_tap="jzaleski/jzaleski";
    if ! ${brew_cmd} tap | \grep "${jzaleski_jzaleski_tap}" > /dev/null 2>&1; then
      ${brew_cmd} tap "${jzaleski_jzaleski_tap}" && \
        ${brew_cmd} trust "${jzaleski_jzaleski_tap}";
    fi

    ghostty_cask="ghostty";
    if $brew_cmd info --cask $ghostty_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd install -y --cask $ghostty_cask;
    fi

    iterm2_cask="iterm2";
    if $brew_cmd info --cask $iterm2_cask | \grep "Not installed" > /dev/null 2>&1; then
      $brew_cmd install -y --cask $iterm2_cask;
    fi

    for package in \
      ag \
      apg \
      bash \
      bash-completion \
      btop \
      curl \
      git \
      gpg \
      htop \
      nvim \
      nvtop \
      openssl \
      python \
      readline \
      ripgrep \
      screen \
      secrets \
      tmux \
      vim \
      wget \
      zsh;
    do
      package_details=$($brew_cmd list $package 2> /dev/null || echo -n);
      if [ -z "$package_details" ]; then
        $brew_cmd install -y $package;
      fi
    done
  fi
fi
