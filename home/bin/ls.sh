#!/bin/bash

ls_cmd=`which ls`;

if [ `uname` == 'Darwin' ];
then
  $ls_cmd -G $@;
else
  $ls_cmd --color $@;
fi
