#!/usr/bin/env bash

if [ "$EDITOR" = "emacs" ] && [ "$FORCE" != "true" ]; then
  echo "Use emacs";
  exit 1;
fi

vim_cmd=`\which vim 2> /dev/null`;
if [ -z "$vim_cmd" ]; then
  echo "Could not locate the \"vim\" binary";
  exit 1;
fi

$vim_cmd "$@";
