#!/bin/bash

python_cmd=`which python`;
if [ -n "$python_cmd" ];
then
  ipython_directory="$SOURCE_DIRECTORY/ipython";
  if [ -d $ipython_directory ];
  then
    (
      cd $ipython_directory &&
      $python_cmd -m IPython $@
    );
  fi
fi
