#!/usr/bin/env bash

if hash htop 2> /dev/null; then
  top_cmd="$HOME/bin/htop.sh";
else
  top_cmd="top";
fi

$top_cmd "$@";
