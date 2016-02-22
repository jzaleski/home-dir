#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ `uname` = "Darwin" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    if [ -z `\which ag 2> /dev/null` ]; then
      $brew_cmd install ag;
    fi
  fi
fi
