#!/usr/bin/env bash

if [ "$EDITOR" = "emacs" ] && [ "$FORCE" != "true" ]; then
  echo "Use emacs";
  exit 1;
fi

if \which vim > /dev/null 2>&1; then
  vi_cmd="vim";
else
  vi_cmd="vi";
fi

$vi_cmd "$@";
