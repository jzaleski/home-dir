#!/usr/bin/env bash

tmux_cmd=`\which tmux 2> /dev/null`;
if [ -z "$tmux_cmd" ]; then
  echo "Could not locate the \"tmux\" binary";
  exit 1;
fi

$tmux_cmd attach 2> /dev/null|| $tmux_cmd;
