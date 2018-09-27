#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  dot_config_dir=$HOME/.config;
  if [ ! -e $dot_config_dir ]; then
    mkdir -p $dot_config_dir;
  fi

  dot_vim_dir=$HOME/.vim;
  if [ ! -e $dot_vim_dir ]; then
    mkdir -p $dot_vim_dir;
  fi

  nvim_dir=$dot_config_dir/nvim;
  if [ -e $nvim_dir ] && [ ! -h $nvim_dir ]; then
    mv $nvim_dir{,.bak};
  fi

  if [ ! -e $nvim_dir ]; then
    ln -s $dot_vim_dir $nvim_dir;
  fi

  dot_vimrc_file=$HOME/.vimrc;
  init_dot_vim_file=$nvim_dir/init.vim;

  if [ -e $dot_vimrc_file ] && [ ! -h $init_dot_vim_file ]; then
    ln -s $dot_vimrc_file $init_dot_vim_file;
  fi
fi
