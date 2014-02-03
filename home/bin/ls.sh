#!/bin/bash

ls_cmd=`which ls`;

# determine which "color" argument to specify
if [ `uname` == 'Darwin' ];
then
  color_arg='-G';
else
  color_arg='--color';
fi

# execute the command
$ls_cmd $color_arg $@;
