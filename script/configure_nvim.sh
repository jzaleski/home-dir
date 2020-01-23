#!/usr/bin/env bash

if ! which nvim 2>&1 > /dev/null; then
  exit 0;
fi

nvim_config_dir="$HOME/.config/nvim";
vim_config_dir="$HOME/.vim";

if [ -e $vim_config_dir ] && [ ! -e $nvim_config_dir ]; then
  ln -s $vim_config_dir $nvim_config_dir;
fi

init_vim_file="$HOME/.config/nvim/init.vim";
vimrc_file="$HOME/.vimrc";

if [ -e $vimrc_file ] && [ ! -e $init_vim_file ]; then
  ln -s $vimrc_file $init_vim_file;
fi
