#!/usr/bin/env bash

if [ $# -eq 1 ]; then
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

  project=`basename $project_directory`;

  deactivate_environment > /dev/null 2>&1;

  virtualenv_activate_file=.python_environment/bin/activate;
  if [ -f $virtualenv_activate_file ]; then
    source $virtualenv_activate_file;
  fi

  freetds_file=$HOME/.freetds.conf.$project;
  if [ -f $freetds_file ]; then
    rm -f $HOME/.freetds.conf;
    ln -s $freetds_file $HOME/.freetds.conf;
  fi

  my_cnf_file=$HOME/.my.cnf.$project;
  if [ -f $my_cnf_file ]; then
    rm -f $HOME/.my.cnf;
    ln -s $my_cnf_file $HOME/.my.cnf;
  fi

  notags_file=$project_directory/.notags;
  if [ -f $notags_file ]; then
    export NOTAGS=true;
  fi

  pgpass_file=$HOME/.pgpass.$project;
  if [ -f $pgpass_file ]; then
    rm -f $HOME/.pgpass;
    ln -sf $pgpass_file $HOME/.pgpass;
  fi

  workonrc_file=$project_directory/.workonrc;
  if [ -f $workonrc_file ]; then
    source $workonrc_file;
  fi

  export PROJECT_DIRECTORY=$project_directory;
fi
