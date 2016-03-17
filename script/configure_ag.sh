#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    ag_package_details=`$brew_cmd list ag 2> /dev/null`;
    if [ -z "$ag_package_details" ]; then
      $brew_cmd install ag;
    fi
  fi
fi
