#!/usr/bin/env bash

# allow tag generation to be turned off globally, per-project or via an env-var
notags_file=.notags;
if \
  [ -f $HOME/$notags_file ] || \
  [ -f $notags_file ] || \
  [ "$NOTAGS" = "true" ];
then
  exit 0;
fi

# ensure that the pkill binary is available
pkill_cmd=`\which pkill 2> /dev/null`;
if [ -z "$pkill_cmd" ]; then
  echo "Could not locate the \"pkill\" binary";
  exit 1;
fi

# attempt to install the homebrew ctags binary (if necessary)
brew_cmd=`\which brew 2> /dev/null`;
if [ -n "$brew_cmd" ] && [ -z `$brew_cmd --prefix ctags 2> /dev/null` ]; then
  $brew_cmd install ctags;
fi

# ensure that the ctags binary is available
ctags_cmd=`\which ctags 2> /dev/null`;
if [ -z "$ctags_cmd" ]; then
  echo "Could not locate the \"ctags\" binary";
  exit 1;
fi

# determine if the gem binary is available and generate ctags for gems if able
gem_cmd=`\which gem 2> /dev/null`;
if [ -n "$gem_cmd" ]; then
  # attempt to install "gem-ctags" (if necessary)
  if ! $gem_cmd list | \grep 'gem-ctags' > /dev/null 2>&1; then
    $gem_cmd install gem-ctags;
  fi
  # generate ctags for gems (if necessary)
  if $gem_cmd list | \grep 'gem-ctags' > /dev/null 2>&1; then
    $gem_cmd ctags > /dev/null 2>&1 &
  fi
fi

# execution artifact(s)
lock_file=tags.lock;
temp_file=tags.tmp;

# ensure that only one ctags instance is running for a given project (if there
# is already a process running, kill it and clean up after it (it won't do so
# itself)
if [ -f $lock_file ]; then
  $pkill_cmd -P `cat $lock_file`;
  rm -f $lock_file $temp_file;
fi

ctags_cmd="$ctags_cmd --tag-relative";
if [ "$EDITOR" = "emacs" ]; then
  ctags_cmd="$ctags_cmd -e";
fi

# start and background the [c]tags generation process
$ctags_cmd -Rf $temp_file --exclude=.git --exclude=tmp > /dev/null 2>&1 && \
  mv $temp_file tags && \
  rm -f $lock_file &

# capture the pid of the last background[ed] process (this will be used if this
# script if re-invoked to determine which process to kill)
echo $! > $lock_file;
