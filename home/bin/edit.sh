#!/usr/bin/env bash

if [ -z "$EDITOR" ]; then
  echo "Could not determine editor";
  exit 1;
fi

editor_cmd=`\which $EDITOR 2> /dev/null`;
if [ -z "$EDITOR" ]; then
  echo "Could not locate \"$EDITOR\" binary";
  exit 1;
fi

$editor_cmd "$@";
