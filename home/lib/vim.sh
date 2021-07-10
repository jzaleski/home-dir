#!/usr/bin/env bash

gvim_cmd=$(which gvim 2> /dev/null || echo -n);
nvim_cmd=$(which nvim 2> /dev/null || echo -n);
vim_cmd=$(which vim 2> /dev/null || echo -n);

if [ -n "$gvim_cmd" ] && [ "$NO_GUI" != "true" ]; then
  $gvim_cmd "$@";
elif [ -n "$nvim_cmd" ]; then
  $nvim_cmd "$@";
elif [ -n "$vim_cmd" ]; then
  $vim_cmd "$@";
else
  echo "Could not locate \"vim\" binary or equivalent";
  exit 1;
fi
