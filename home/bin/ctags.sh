#!/usr/bin/env bash

# allow tag generation to be turned off globally or per-project
notags_file=.notags;
if [ -f $HOME/$notags_file ] || [ -f $notags_file ]; then
  exit 0;
fi

# ensure that the pkill binary is available
if ! hash pkill 2> /dev/null; then
  echo "Could not locate the \"pkill\" binary";
  exit 1;
fi

# attempt to install the homebrew ctags binary (if necessary)
if hash brew 2> /dev/null && ! brew --prefix ctags > /dev/null 2>&1; then
  brew install ctags;
fi

# ensure that the ctags binary is available
if ! hash ctags 2> /dev/null; then
  echo "Could not locate the \"ctags\" binary";
  exit 1;
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

# execution artifact(s)
lock_file=tags.lock;
temp_file=tags.tmp;

# ensure that only one ctags instance is running for a given project (if there
# is already a process running, kill it and clean up after it (it won't do so
# itself)
if [ -f $lock_file ]; then
  pkill -P `cat $lock_file`;
  rm -f $lock_file $temp_file;
fi

# start and background the [c]tags generation process
ctags --tag-relative -Rf $temp_file --exclude=.git > /dev/null 2>&1 && mv $temp_file tags && rm -f $lock_file &

# capture the pid of the last background[ed] process (this will be used if this
# script if re-invoked to determine which process to kill)
echo $! > $lock_file;
