#!/bin/bash

if [ -n `which egrep` ];
then
  grep_cmd='egrep --color';
else
  grep_cmd='grep';
fi

$grep_cmd $@;
