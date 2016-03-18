#!/usr/bin/env bash

if [ -n `\which nvim 2> /dev/null` ]; then
  nvim $@;
  exit $?;
elif [ -n `\which vim 2> /dev/null` ]; then
  vim $@;
  exit $?;
elif [ -n `\which vi 2> /dev/null` ]; then
  vi $@;
  exit $?;
else
  echo "Could not locate a valid \"vim\" binary";
  exit 1;
fi
