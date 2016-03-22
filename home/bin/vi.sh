#!/usr/bin/env bash

if [ -n `\which nvim 2> /dev/null` ]; then
  nvim $@;
  exit $?;
elif [ -n `\which vim 2> /dev/null` ]; then
  vim $@;
  exit $?;
else
  vi $@;
  exit $?;
fi
