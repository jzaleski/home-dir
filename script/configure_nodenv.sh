#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    nodenv_package_details=`$brew_cmd list nodenv 2> /dev/null`;
    if [ -z "$nodenv_package_details" ]; then
      $brew_cmd install nodenv;
    fi
  fi
fi
