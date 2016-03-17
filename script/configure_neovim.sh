#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    neovim_package_details=`$brew_cmd list neovim 2> /dev/null`;
    if [ -z "$neovim_package_details" ]; then
      $brew_cmd install neovim/neovim/neovim;
    fi
  fi
fi
