#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    python_package_details=`$brew_cmd list python 2> /dev/null`;
    if [ -z "$python_package_details" ]; then
      $brew_cmd install python;
    fi
  fi
fi
