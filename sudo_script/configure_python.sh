#!/bin/bash

# prefer "pip"
pip_cmd=`which pip`
if [ -z "$pip_cmd" ];
then
  easy_install pip;
  pip_cmd=`which pip`;
fi

# install base "egg(s)"
for egg in \
  virtualenv;
do
  $pip_cmd install $egg;
done
