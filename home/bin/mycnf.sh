#!/usr/bin/env bash

if [ $# -gt 2 ] && [ $1 == 'generate' ]; then
  file=$HOME/.my.cnf.$2;
  cp $HOME/.base.my.cnf $file;
  echo -e "\n[client]" >> $file;
  for arg in "${@:3}"; do
    echo "${arg/--/}" >> $file;
  done
  exit 0;
fi

if [ $# -eq 1 ] && [ $1 != 'generate' ]; then
  file=$HOME/.my.cnf.$1;
  if [ -f $file ]; then
    ln -sf $file $HOME/.my.cnf;
    exit 0;
  else
    echo "could not find a .my.cnf file at: $file";
    exit 255;
  fi
fi

echo "Usage: `basename $0` [my_cnf_file] | [generate --key=value ... ]"
exit 2;
