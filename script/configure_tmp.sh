#!/usr/bin/env bash

# ensure that the [user-specific] Shared directory exists
shared_dir="$HOME/Shared";
if [ ! -e $shared_dir ]; then
  mkdir -p $shared_dir;
fi

# if $temp_dir exists, relocate its contents then remove it
temp_dir=$HOME/tmp;
if [ -e $temp_dir ] && [ ! -h $temp_dir ]; then
  mv $temp_dir/* $shared_dir 2> /dev/null;
  rm -rf $temp_dir;
fi

# sym-link $shared_dir to $temp_dir if necessary
if [ ! -e $temp_dir ]; then
  ln -s $shared_dir $temp_dir;
fi
