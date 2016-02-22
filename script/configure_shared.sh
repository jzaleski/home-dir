#!/usr/bin/env bash

home_shared_dir=$HOME/Shared;
mnt_shared_dir=/mnt/Shared;
if [ -d $mnt_shared_dir ] && [ ! -h $home_shared_dir ]; then
  ln -s $mnt_shared_dir $home_shared_dir;
fi

if [ ! -h $home_shared_dir ] && [ ! -d $mnt_shared_dir ]; then
  mkdir -p $home_shared_dir;
fi
