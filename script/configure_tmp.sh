#!/usr/bin/env bash

# ensure that the [user-specific] Shared directory exists
shared_dir="$HOME/Shared";
if [ ! -d "$shared_dir" ]; then
  mkdir -p $shared_dir;
fi

# if $temp_dir exists, relocate its contents, remove it and then sym-link it
temp_dir=$HOME/tmp;
if [ -d "$temp_dir" ]; then
  mv $temp_dir/* $shared_dir 2> /dev/null;
  rm -rf $temp_dir;
  ln -s $shared_dir $temp_dir;
fi
