#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  rbenv_dir=$HOME/.rbenv;
  if [ ! -d $rbenv_dir ]; then
    git clone https://github.com/rbenv/rbenv.git $rbenv_dir;
  fi
  rbenv_plugins_dir=$rbenv_dir/plugins;
  if [ ! -d $rbenv_plugins_dir ]; then
    mkdir -p $rbenv_plugins_dir;
  fi
  ruby_build_dir=$rbenv_plugins_dir/ruby-build;
  if [ ! -d $ruby_build_dir ]; then
    git clone https://github.com/rbenv/ruby-build.git $ruby_build_dir;
  fi
fi
