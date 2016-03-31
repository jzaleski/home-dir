#!/usr/bin/env bash

realsync_cmd="$SOURCE_DIRECTORY/dklab_realsync/realsync";
if [ ! -f $realsync_cmd ]; then
  echo "Could not locate the \"realsync\" binary";
  exit 1;
fi

$realsync_cmd "$@";
