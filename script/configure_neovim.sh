#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  nvim_cmd=`\which nvim 2> /dev/null`;
  if [ -n "$nvim_cmd" ]; then
    dot_config_dir=$HOME/.config;
    if [ ! -d $dot_config_dir ]; then
      mkdir $dot_config_dir;
    fi

    nvim_dir=$dot_config_dir/nvim;
    if [ -e $nvim_dir ] && [ ! -h $nvim_dir ]; then
      mv $nvim_dir{,.bak};
    fi

    dot_vim_dir=$HOME/.vim;
    if [ -e $dot_vim_dir ] && [ ! -e $nvim_dir ]; then
      ln -s $dot_vim_dir $nvim_dir;
    fi

    dot_vimrc_file=$HOME/.vimrc;
    init_dot_vim_file=$nvim_dir/init.vim;

    if [ -e $dot_vimrc_file ] && [ ! -h $init_dot_vim_file ]; then
      ln -s $dot_vimrc_file $init_dot_vim_file;
    fi
  fi
fi
