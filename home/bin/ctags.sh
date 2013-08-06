#!/bin/bash

# used to determine if homebrew is installed
brew_cmd=`which brew`;

# attempt to install the homebrew ctags library (if necessary)
if [ -n "$brew_cmd" ] && [ ! -d `$brew_cmd --prefix ctags` ]
then
   $brew_cmd install ctags;
fi

# used to determine if ctags is installed
ctags_cmd=`which ctags`;

# verify that the ctags library is present
if [ -n "$ctags_cmd" ];
then
  rm -f .git/tags;
  $ctags_cmd -R -f .git/tags . > /dev/null 2>&1 &
fi
