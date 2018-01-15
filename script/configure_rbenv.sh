#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    rbenv_package_details=`$brew_cmd list rbenv 2> /dev/null`;
    if [ -z "$rbenv_package_details" ]; then
      $brew_cmd install rbenv;
    fi
  fi
fi
