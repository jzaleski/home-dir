#!/usr/bin/env bash

# allow tag generation to be turned off globally or per-project
notags_file=.notags;
if [ -f $HOME/$notags_file ] || [ -f $notags_file ]; then
  exit 0;
fi

# ensure that the pkill binary is available
if ! \which pkill > /dev/null 2>&1; then
  echo "Could not locate the \"pkill\" binary";
  exit 1;
fi

# attempt to install the homebrew ctags binary (if necessary)
if \which brew > /dev/null 2>&1 && [ -z `brew --prefix ctags 2> /dev/null` ]; then
  brew install ctags;
fi

# ensure that the ctags binary is available
if ! \which ctags > /dev/null 2>&1; then
  echo "Could not locate the \"ctags\" binary";
  exit 1;
fi

# attempt to install "gem-ctags" (if necessary)
if ! gem list | \grep 'gem-ctags' > /dev/null 2>&1; then
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

ctags_cmd="ctags --tag-relative";
if [ "$EDITOR" = "emacs" ]; then
  ctags_cmd="$ctags_cmd -e";
fi

# start and background the [c]tags generation process
$ctags_cmd -Rf $temp_file --exclude=.git > /dev/null 2>&1 && mv $temp_file tags && rm -f $lock_file &

# capture the pid of the last background[ed] process (this will be used if this
# script if re-invoked to determine which process to kill)
echo $! > $lock_file;
