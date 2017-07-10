#!/usr/bin/env bash

if [ $# -ge 1 ]; then
  if [ "$1" = "." ]; then
    project_directory=$PWD;
  elif [ -d $1 ]; then
    project_directory="$PWD/$1";
  else
    project_directory=$SOURCE_DIRECTORY/$1;
  fi

  if [ ! -d $project_directory ]; then
    echo "Project directory does not exist";
    exit 1;
  fi

  builtin cd $project_directory;

  deactivate 2> /dev/null || true;

  virtualenv_directory=.env;
  if [ -n "$2" ]; then
    virtualenv_directory=$virtualenv_directory-$2;
  fi

  activate_script=$project_directory/$virtualenv_directory/bin/activate;
  if [ -f $activate_script ]; then
    source $activate_script;
  fi

  unset RUBY_GEMSET;

  gemset_file=$project_directory/.ruby-gemset;
  if [ -f $gemset_file ]; then
    export RUBY_GEMSET=`cat $gemset_file`;
  fi

  freetds_file=$HOME/.freetds.conf.$project;
  if [ -f $freetds_file ]; then
    ln -sf $freetds_file "$HOME/.freetds.conf";
  fi

  my_cnf_file=$HOME/.my.cnf.$project;
  if [ -f $my_cnf_file ]; then
    ln -sf $my_cnf_file "$HOME/.my.cnf";
  fi

  pgpass_file=$HOME/.pgpass.$project;
  if [ -f $pgpass_file ]; then
    ln -sf $pgpass_file "$HOME/.pgpass";
  fi

  workonrc_file=$project_directory/.workonrc;
  if [ -f $workonrc_file ]; then
    source $workonrc_file;
  fi
fi
