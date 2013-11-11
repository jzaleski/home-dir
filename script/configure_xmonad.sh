#!/bin/bash

XMONAD_BINARY="$HOME/bin/xmonad";
if [ -f $XMONAD_BINARY ];
then
  $XMONAD_BINARY --recompile;
fi
