#!/usr/bin/env bash

if [ $# -ge 1 ]; then
  project=$1;
  project_directory=$SOURCE_DIRECTORY/$project;
  if [ -d $project_directory ]; then
    cd $project_directory;
  else
    echo "Project \"$project\" does not exist";
    exit 1;
  fi

  branch=$2;
  git_cmd=`which git 2> /dev/null`;
  if [ -n "$git_cmd" ] && [ -n "$branch" ]; then
    $git_cmd checkout $branch 1> /dev/null;
  fi

  deactivate 2> /dev/null || true;

  activate_script=$VIRTUALENVS_DIRECTORY/$project/bin/activate;
  if [ -f $activate_script ]; then
    source $activate_script;
  fi

  my_cnf_file=$HOME/.my.cnf.$project;
  if [ -f $my_cnf_file ]; then
    ln -sf $my_cnf_file "$HOME/.my.cnf";
  fi

  pgpass_file=$HOME/.pgpass.$project;
  if [ -f $pgpass_file ]; then
    ln -sf $pgpass_file "$HOME/.pgpass";
  fi
fi
