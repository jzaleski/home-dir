#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  psysh_cmd=$HOME/bin/psysh;
  if [ -n `\which php 2> /dev/null` ] && [ ! -f $psysh_cmd ]; then
    \wget -O $psysh_cmd http://psysh.org/psysh &&
    chmod +x $psysh_cmd;
  fi
fi
