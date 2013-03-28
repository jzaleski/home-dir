#!/bin/bash

grep_cmd=`which egrep`;

if [ -n "$grep_cmd" ];
then
  $grep_cmd --color $@;
fi
