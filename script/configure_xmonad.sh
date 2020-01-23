#!/usr/bin/env bash

if [ -n "$BOOTSTRAP_DESKTOP_ENVIRONMENT" ]; then
  xmonad_cmd=$(which xmonad 2> /dev/null || echo -n);
  if [ -n "$xmonad_cmd" ]; then
    $xmonad_cmd --recompile;
  fi
fi
