#!/usr/bin/env bash

# ensure that ".vim" and "vimfiles" are in sync
cp -aiur $HOME/.vim $HOME/vimfiles

# ensure that ".vimrc" and "_vimrc" are in sync
cp -aiu $HOME/.vimrc $HOME/_vimrc
