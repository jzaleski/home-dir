#!/bin/bash

# attempt to install the homebrew ctags library (if necessary)
if hash brew 2> /dev/null && ! brew --prefix ctags > /dev/null 2>&1;
then
  brew install ctags;
fi

# attempt to install "gem-ctags" (if necessary)
if hash rvm 2> /dev/null && ! gem list | grep 'gem-ctags' > /dev/null 2>&1;
then
  bash -l -c "rvm gemset use global && gem install gem-ctags";
fi

# generate ctags for gems
gem ctags > /dev/null 2>&1 &

# verify that the ctags library is present
if hash ctags 2> /dev/null;
then
  rm -f tags;
  ctags --tag-relative -Rf tags --exclude=.git > /dev/null 2>&1 &
fi
