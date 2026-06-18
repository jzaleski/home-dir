#!/usr/bin/env bash

# ensure that bootstrap is running from the project-root
cd $(dirname $0)/..;

# ensure that all submodules are initialized and up to date (if we're working
# in a git repository and not a slug)
if [ -e $PWD/.gitmodules ]; then
  git submodule init && git submodule update;
fi

# manifest of files to automatically ignore (e.g. not overwrite) rather than
# prompting to overwrite on every run
bootstrap_ignore_file=.bootstrapignore;

# if `$ASSUME_YES` is `"true"` *do not* prompt before overwriting
cp_flags="-a";
if [ "$ASSUME_YES" != "true" ]; then
  cp_flags="${cp_flags}i";
fi

# find files, directories and symbolic-links
for d in home overrides; do
  for o in $(find $d -type d -o -type f -o -type l | \grep -E "^$d/(.+)" | sed "s/$d\///g"); do
    # calculate the source/destination values
    source_object=$d/$o;
    destination_object=$HOME/$o;
    # if it's ignored
    if [ -e $bootstrap_ignore_file ] && \grep "$o" $bootstrap_ignore_file > /dev/null 2>&1; then
      continue;
    # if it's a directory and it does not exist
    elif [ -d $source_object ] && [ ! -d $destination_object ]; then
      mkdir -p $destination_object;
    # if it's a file and it does not exist or it is different
    elif [ -f $source_object ] && ([ ! -f $destination_object ] || ! cmp $source_object $destination_object > /dev/null 2>&1); then
      cp $cp_flags $source_object $destination_object;
    fi
  done
done

# reload the shell-config (it may have changed)
source $HOME/.bashrc;

# run scripts optionally w/ any abitrary prefix (e.g. "sudo")
function run_scripts() {
  for f in $(\find $1 -type f -o -type l | \grep -E "^$1/[^\.](.+)" | sed "s/$1\///g"); do
    $2 $1/$f;
  done
}

# mock away the `shell_session_update` function w/ a noop
function shell_session_update() {
  :;
}

# run any files in "sudo_script" (the assumption is that things requiring root
# should occur first)
# Pass environment variables explicitly rather than relying on `sudo -E`, which
# is blocked by the default `env_reset` / `secure_path` policy on modern Ubuntu
# (24.04+) unless the sudoers rule grants SETENV.  Passing vars inline with
# `sudo VAR=value …` works regardless of that policy.
if which sudo > /dev/null 2>&1; then
  sudo_env=""
  [ -n "$EXTENDED_BOOTSTRAP" ]          && sudo_env="${sudo_env} EXTENDED_BOOTSTRAP=${EXTENDED_BOOTSTRAP}"
  [ -n "$BOOTSTRAP_DESKTOP_ENVIRONMENT" ] && sudo_env="${sudo_env} BOOTSTRAP_DESKTOP_ENVIRONMENT=${BOOTSTRAP_DESKTOP_ENVIRONMENT}"
  [ -n "$ASSUME_YES" ]                   && sudo_env="${sudo_env} ASSUME_YES=${ASSUME_YES}"
  run_scripts 'sudo_script' "sudo env ${sudo_env}"
fi

# run any files in "script"
run_scripts 'script'
