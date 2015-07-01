#!/usr/bin/env bash

# ensure that the pkill binary is available
if ! hash pkill 2> /dev/null; then
  echo "Could not locate the \"pkill\" binary";
  exit 1;
fi

# attempt to install the homebrew ctags binary (if necessary)
if hash brew 2> /dev/null && ! brew --prefix ctags > /dev/null 2>&1; then
  brew install ctags;
fi

# attempt to install "gem-ctags" (if necessary)
if hash rvm 2> /dev/null && ! gem list | \grep 'gem-ctags' > /dev/null 2>&1; then
  bash -l -c "rvm gemset use global && gem install gem-ctags";
elif ! gem list | \grep 'gem-ctags' > /dev/null 2>&1; then
  gem install gem-ctags;
fi

# generate ctags for gems (if necessary)
if gem list | \grep 'gem-ctags' > /dev/null 2>&1; then
  gem ctags > /dev/null 2>&1 &
fi

# ensure that only one ctags instance is running for a given project (if there
# is already a process running, kill it and clean up after it (it won't do so
# itself)
lock_file=tags.lock;
if [ -f $lock_file ]; then
  pkill -P `cat $lock_file`;
  rm -f tags.*;
fi

# verify that the ctags binary is present
if hash ctags 2> /dev/null; then
  tags_file="tags.`date +%s`";
  ctags --tag-relative -Rf $tags_file --exclude=.git > /dev/null 2>&1 && mv $tags_file tags && rm -f $lock_file &
  echo $! > $lock_file;
fi
