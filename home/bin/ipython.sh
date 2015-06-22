#!/usr/bin/env bash

python_cmd=`\which python 2> /dev/null`;
if [ -n "$python_cmd" ]; then
  (source ~/bin/workon.sh ipython && $python_cmd -m IPython "$@");
fi
