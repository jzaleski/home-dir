#!/usr/bin/env bash

if \which htop > /dev/null 2>&1; then
  top_cmd="$HOME/bin/htop.sh";
else
  top_cmd="top";
fi

$top_cmd "$@";
