#!/usr/bin/env bash

pip_cmd=$(which pip 2> /dev/null || echo -n);
if [ -z "$pip_cmd" ]; then
  exit 0;
fi

if ! $pip_cmd freeze | \grep "list-cli" > /dev/null; then
  $pip_cmd install list-cli;
fi

pyenv_cmd=$(which pyenv 2> /dev/null || echo -n);
if [ -n "$pyenv_cmd" ]; then
  $pyenv_cmd rehash;
fi

dot_list_dir=$HOME/.list;
if [ ! -e "$dot_list_dir" ]; then
  mkdir -p $dot_list_dir;
fi
