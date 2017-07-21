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

  deactivate > /dev/null 2>&1 || true;

  python_environment_directory=.python_environment;
  if [ -n "$2" ]; then
    python_environment_directory=$python_environment_directory-$2;
  fi

  if [ -d $python_environment_directory ] || [ -h $python_environment_directory ]; then
    python_environment_directory=`readlink -f $python_environment_directory`;
    python_version=`echo $python_environment_directory | \
      sed -E "s/.+\-([0-9]+\.[0-9]+)\.[0-9]*$/\1/"`;
    export PIP_CONFIG_FILE=$python_environment_directory/pip.conf;
    export PYTHONPATH=$python_environment_directory/lib/python$python_version/site-packages;
    export PYTHON_ENVIRONMENT=$python_environment_directory;
    export PATH=$python_environment_directory/bin:$PATH;
  fi

  ruby_environment_directory=.ruby_environment;
  if [ -n "$2" ]; then
    ruby_environment_directory=$ruby_environment_directory-$2;
  fi

  if [ -d $ruby_environment_directory ] || [ -h $ruby_environment_directory ]; then
    ruby_environment_directory=`readlink -f $ruby_environment_directory`;
    export GEM_HOME=$ruby_environment_directory;
    export GEM_PATH=$ruby_environment_directory;
    export RUBY_ENVIRONMENT=$ruby_environment_directory;
    export PATH=$ruby_environment_directory/bin:$PATH;
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

  export PROJECT_DIRECTORY=$project_directory;
fi
