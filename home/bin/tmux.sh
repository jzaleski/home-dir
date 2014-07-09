#!/usr/bin/env bash

if ! hash tmux 2> /dev/null; then
  if [ `uname` = "Darwin" ]; then
    brew install tmux;
  else
    sudo apt-get install tmux;
  fi
fi

if ! hash tmux 2> /dev/null; then
  echo "Could not locate the \"tmux\" binary";
  exit 1;
fi

(tmux attach || tmux) 2> /dev/null;
