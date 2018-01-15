#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    pyenv_package_details=`$brew_cmd list pyenv 2> /dev/null`;
    if [ -z "$pyenv_package_details" ]; then
      $brew_cmd install pyenv;
    fi
  fi
fi
