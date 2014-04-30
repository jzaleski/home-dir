#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  apt_get_cmd=`which apt-get`;
  if [ -n "$apt_get_cmd" ];
  then
    $apt_get_cmd install -y apg exuberant-ctags git tmux vim zsh;
  fi
fi
