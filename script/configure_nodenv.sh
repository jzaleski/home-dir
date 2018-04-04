#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  nodenv_dir=$HOME/.nodenv;
  if [ ! -d $nodenv_dir ]; then
    git clone https://github.com/nodenv/nodenv.git $nodenv_dir;
  fi
  nodenv_plugins_dir=$nodenv_dir/plugins;
  if [ ! -d $nodenv_plugins_dir ]; then
    mkdir -p $nodenv_plugins_dir;
  fi
  node_build_dir=$nodenv_plugins_dir/node-build;
  if [ ! -d $node_build_dir ]; then
    git clone https://github.com/nodenv/node-build.git $node_build_dir;
  fi
fi
