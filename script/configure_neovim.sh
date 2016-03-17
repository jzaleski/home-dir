#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  brew_cmd=`\which brew 2> /dev/null`;
  if [ -n "$brew_cmd" ]; then
    neovim_package_details=`$brew_cmd list neovim 2> /dev/null`;
    if [ -z "$neovim_package_details" ]; then
      $brew_cmd install neovim/neovim/neovim;
    fi

    config_dir=$HOME/.config;
    if [ ! -d $config_dir ]; then
      mkdir -p $config_dir;
    fi

    nvim_dir_link=$config_dir/nvim;
    if [ ! -h $nvim_dir_link ]; then
      ln -s $HOME/.vim $nvim_dir_link;
    fi

    init_dot_vim_link=$nvim_dir_link/.init.vim;
    if [ ! -h $init_dot_vim_file_link ]; then
      ln -s $HOME/.vimrc $init_dot_vim_file_link;
    fi
  fi
fi
