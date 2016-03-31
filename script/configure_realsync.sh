#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  realsync_dir="$SOURCE_DIRECTORY/dklab_realsync";
  if [ ! -d $realsync_dir ]; then
    cd $SOURCE_DIRECTORY && git clone https://github.com/DmitryKoterov/dklab_realsync.git;
  fi
fi
