#!/bin/bash

if [ $# -eq 1 ];
then
  my_cnf_file="$HOME/.my.cnf.$1";
  if [ -f $my_cnf_file ];
  then
    ln -sf $my_cnf_file "$HOME/.my.cnf";
  fi

  deactivate 2> /dev/null;
  activate_script="$VIRTUALENVS_DIRECTORY/$1/bin/activate";
  if [ -f $activate_script ];
  then
    source $activate_script;
  fi

  project_directory="$SOURCE_DIRECTORY/$1";
  if [ -d $project_directory ];
  then
    cd $project_directory;
  else
    echo "Project \"$1\" does not exist";
  fi
fi
