#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ];
then
  # configure "IPython"
  ipython_virtualenv_directory="$VIRTUALENVS_DIRECTORY/ipython";
  if [ ! -d $ipython_virtualenv_directory ];
  then
    virtualenv $ipython_virtualenv_directory --no-site-packages;
  fi

  # install "IPython" specific egg(s)
  (source ~/bin/workon.sh ipython && easy_install -a readline);
fi
