#!/usr/bin/env bash

if [ $# -eq 1 ]; then
  MY_CNF_FILE=$HOME/.my.cnf.$1;
  if [ -f $MY_CNF_FILE ]; then
    ln -sf $MY_CNF_FILE "$HOME/.my.cnf";
  fi

  deactivate 2> /dev/null;

  ACTIVATE_SCRIPT=$VIRTUALENVS_DIRECTORY/$1/bin/activate;
  if [ -f $ACTIVATE_SCRIPT ]; then
    source $ACTIVATE_SCRIPT;
  fi

  PROJECT_DIRECTORY=$SOURCE_DIRECTORY/$1;
  if [ -d $PROJECT_DIRECTORY ]; then
    cd $PROJECT_DIRECTORY;
  else
    echo "Project \"$1\" does not exist";
  fi
fi
