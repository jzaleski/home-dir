#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ -n `which gnome-terminal` ]; then
  # configuration
  project="gnome-terminal-colors-solarized";
  project_directory=$SOURCE_DIRECTORY/$project;
  echo $project_directory;
  # clone the repository (if it doesn't exist)
  if [ ! -d $project_directory ]; then
    (cd $SOURCE_DIRECTORY && git clone https://github.com/Anthony25/${project}.git);
  fi

  dconf_cmd=`which dconf`;
  if [ -z "$dconf_cmd" ]; then
    echo "Could not locate \"dconf\"";
    exit 255;
  fi

  # update the color-scheme
  (cd $project_directory && ./set_dark.sh);
fi
