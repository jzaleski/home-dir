#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  jenv_dir=$HOME/.jenv;
  if [ ! -d $jenv_dir ]; then
    git clone https://github.com/jenv/jenv.git $jenv_dir;
  fi
  jenv_versions_dir=$jenv_dir/versions;
  if [ ! -d $jenv_versions_dir ]; then
    mkdir -p $jenv_versions_dir;
  fi
fi
