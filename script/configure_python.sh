#!/bin/bash

# prefer "pip"
pip_cmd=`which pip`
if [ -z "$pip_cmd" ];
then
  sudo easy_install pip;
  pip_cmd=`which pip`;
fi

# install base "egg(s)"
for egg in \
  virtualenv;
do
  sudo $pip_cmd install $egg;
done

# configure "IPython"
ipython_virtualenv_directory="$VIRTUALENVS_DIRECTORY/ipython";
if [ ! -d $ipython_virtualenv_directory ];
then
  virtualenv $ipython_virtualenv_directory --no-site-packages;
fi

# install "IPython" specific egg(s)
(source ~/bin/workon.sh ipython && easy_install -a readline);
