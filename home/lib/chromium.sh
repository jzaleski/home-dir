#!/usr/bin/env bash

kernel_name=$(uname -s 2> /dev/null || echo -n);
if [ "$kernel_name" = "Darwin" ]; then
  chromium_cmd="/Applications/Chromium.app/Contents/MacOS/Chromium";
elif [ "$kernel_name" = "Linux" ]; then
  chromium_cmd="/usr/bin/chromium-browser";
fi

if [ ! -e "$chromium_cmd" ]; then
  echo "Could not locate the \"Chromium\" binary";
  exit 1;
fi

uuidgen_cmd=$(which uuidgen 2> /dev/null || echo -n);
if [ -z "$uuidgen_cmd" ]; then
  echo "Could not locate the \"uuidgen\" binary";
  exit 1;
fi

multi=${MULTI:-"false"};
user_data_dir=${USER_DATA_DIR:-"/tmp/chromium-$("$uuidgen_cmd")"};

if [ "$multi" = "true" ]; then
  $chromium_cmd --user-data-dir="$user_data_dir" "$@";
else
  $chromium_cmd "$@";
fi
