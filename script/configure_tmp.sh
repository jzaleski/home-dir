#!/usr/bin/env bash

# ensure that the [user-specific] downloads directory exists
mkdir -p $HOME/tmp;
downloads_dir="$HOME/Downloads";
if [ ! -d "$downloads_dir" ]; then
  mkdir $downloads_dir;
fi

# if $temp_dir exists, relocate its contents and remove it
temp_dir=$HOME/tmp;
if [ ! -h "$temp_dir" ]; then
  mv $temp_dir/* $downloads_dir 2> /dev/null;
  rm -rf $temp_dir;
  ln -s $downloads_dir $temp_dir;
fi
