#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  pyenv_dir=$HOME/.pyenv;
  if [ ! -d $pyenv_dir ]; then
    git clone https://github.com/pyenv/pyenv.git $pyenv_dir;
  fi
fi
