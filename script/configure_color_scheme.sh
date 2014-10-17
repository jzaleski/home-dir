#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  if [ `uname` = "Darwin" ]; then
    git_user="altercation";
    project="solarized";
    local_directory=$SOURCE_DIRECTORY/$project;

    if [ ! -d $local_directory ]; then
      (cd $SOURCE_DIRECTORY && git clone https://github.com/${git_user}/${project}.git);
    fi
  elif [ `uname` = "Linux" ]; then
    git_user="Anthony25";
    project="gnome-terminal-colors-solarized";
    local_directory=$SOURCE_DIRECTORY/$project;

    if [ ! -d $local_directory ]; then
      (cd $SOURCE_DIRECTORY && git clone https://github.com/${git_user}/${project}.git);
    fi
  fi
fi
