#!/usr/bin/env bash

set -e;

if [ $(uname) = "Darwin" ]; then
  code_cmd="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code";
else
  code_cmd="/usr/bin/code";
fi

if [ ! -e "$code_cmd" ]; then
  echo "Could not locate the \"code\" binary";
  exit 1;
fi

"$code_cmd" "$@";
