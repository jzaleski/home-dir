#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  # clone the repository
  ipython_directory=$SOURCE_DIRECTORY/ipython;
  if [ ! -d $ipython_directory ]; then
    (cd $SOURCE_DIRECTORY && git clone https://github.com/ipython/ipython.git);
  # update the repository
  else
    (cd $ipython_directory && git pull);
  fi

  # configure
  ipython_virtualenv_directory=$VIRTUALENVS_DIRECTORY/ipython;
  if [ ! -d $ipython_virtualenv_directory ]; then
    virtualenv $ipython_virtualenv_directory --no-site-packages;
  fi

  # install "IPython" specific egg(s)
  (source ~/bin/workon.sh ipython && pip install readline);
fi
