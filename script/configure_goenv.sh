#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  goenv_dir=$HOME/.goenv;
  if [ ! -d $goenv_dir ]; then
    git clone https://github.com/syndbg/goenv.git $goenv_dir;
  fi
fi
