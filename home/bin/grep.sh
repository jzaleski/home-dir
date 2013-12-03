#!/bin/bash

if [ -n `which ag` ];
then
  grep_cmd='ag';
elif [ -n `which egrep` ];
then
  grep_cmd='egrep --color';
else
  grep_cmd='grep';
fi

$grep_cmd $@;
