#!/usr/bin/env bash

# ensure that the [user-specific] downloads directory exists
mkdir -p $HOME/tmp;
downloads_dir="$HOME/Downloads";
if [ ! -d "$downloads_dir" ]; then
  mkdir $downloads_dir;
fi

# if $temp_dir exists, relocate its contents and remove it
temp_dir=$HOME/tmp;
if [ -d "$temp_dir" ]; then
  mv $temp_dir/* $downloads_dir;
  rm -r $temp_dir;
fi

# Symlink $temp_dir to $downloads_dir
if [ ! -h "$temp_dir" ]; then
  ln -s $downloads_dir $temp_dir;
fi
