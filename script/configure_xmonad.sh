#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  XMONAD_BINARY="$HOME/bin/xmonad";
  if [ -f $XMONAD_BINARY ];
  then
    $XMONAD_BINARY --recompile;
  fi
fi
