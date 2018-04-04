#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  sbtenv_dir=$HOME/.sbtenv;
  if [ ! -d $sbtenv_dir ]; then
    git clone https://github.com/sbtenv/sbtenv.git $sbtenv_dir;
  fi
fi
