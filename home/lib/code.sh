#!/usr/bin/env bash

set -e;

code_cmd="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code";
if [ ! -e "$code_cmd" ]; then
  echo "Could not locate the \"code\" binary";
  exit 1;
fi

"$code_cmd" "$@";
