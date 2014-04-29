#!/bin/bash

python_cmd=`which python`;

if [ -n "$python_cmd" ];
then
  (source ~/bin/workon.sh ipython && $python_cmd -m IPython "$@");
fi
