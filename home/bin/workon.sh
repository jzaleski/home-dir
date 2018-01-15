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

  node_version_file=$project_directory/.node-version;
  if [ -f $node_version_file ]; then
    export NODE_VERSION=`cat $node_version_file`;
  fi

  python_version_file=$project_directory/.python-version;
  if [ -f $python_version_file ]; then
    export PYTHON_VERSION=`cat $python_version_file`;
  fi

  ruby_version_file=$project_directory/.ruby-version;
  if [ -f $ruby_version_file ]; then
    export RUBY_VERSION=`cat $ruby_version_file`;
  fi

  export PROJECT_DIRECTORY=$project_directory;
fi
