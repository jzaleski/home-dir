#!/usr/bin/env bash

home_desktop_dir=$HOME/Desktop;
home_desktop_shared_dir=$home_desktop_dir/Shared;
home_downloads_dir=$HOME/Downloads;
home_shared_dir=$HOME/Shared;
home_tmp_dir=$HOME/tmp;

if [ ! -e $home_downloads_dir ]; then
  mkdir -p $home_downloads_dir;
fi

if [ -e $home_shared_dir ] && [ ! -h $home_shared_dir ]; then
  mv $home_shared_dir/* $home_downloads_dir 2> /dev/null;
  rm -rf $home_shared_dir;
fi

if [ ! -e $home_shared_dir ]; then
  ln -s $home_downloads_dir $home_shared_dir;
fi

if [ -e $home_tmp_dir ] && [ ! -h $home_tmp_dir ]; then
  mv $home_tmp_dir/* $home_downloads_dir 2> /dev/null;
  rm -rf $home_tmp_dir;
fi

if [ ! -e $home_tmp_dir ]; then
  ln -s $home_downloads_dir $home_tmp_dir;
fi

if [ ! -e $home_desktop_dir ]; then
  mkdir -p $home_desktop_dir;
fi

if [ -e $home_desktop_shared_dir ] && [ ! -h $home_desktop_shared_dir ]; then
  mv $home_desktop_shared_dir/* $home_downloads_dir 2> /dev/null;
  rm -rf $home_desktop_shared_dir;
fi

if [ ! -e $home_desktop_shared_dir ]; then
  ln -s $home_shared_dir $home_desktop_shared_dir;
fi
