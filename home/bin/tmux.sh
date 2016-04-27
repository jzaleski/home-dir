#!/usr/bin/env bash

if ! hash tmux 2> /dev/null; then
  echo "Could not locate the \"tmux\" binary";
  exit 1;
fi

if [ $# -eq 0 ]; then
  \tmux attach 2> /dev/null || \tmux;
else
  \tmux "$@";
fi
