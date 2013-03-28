#!/bin/bash

ctags_cmd=`which ctags`;
if [ $? -eq 0 ];
then
  gem_cmd=`which gem`;
  if [ $? -eq 0 ];
  then
    [[ `gem list | grep -c gem-ctags` -eq 0 ]] && $gem_cmd install gem-ctags 1> /dev/null;
    $gem_cmd ctags 1> /dev/null;
  fi
  rm -f .git/tags;
  $ctags_cmd -f .git/tags . > /dev/null 2>&1 &
fi
