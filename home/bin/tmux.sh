#!/usr/bin/env bash

tmux_cmd=`\which tmux 2> /dev/null`;
if [ -z "$tmux_cmd" ]; then
  echo "Could not locate the \"tmux\" binary";
  exit 1;
fi

if [ $# -eq 0 ]; then
  $tmux_cmd attach 2> /dev/null || $tmux_cmd;
else
  $tmux_cmd "$@";
fi
