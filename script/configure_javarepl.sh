#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && ! \which javarepl > /dev/null 2>&1; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    $brew_cmd install javarepl;
  fi
fi
