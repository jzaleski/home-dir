#!/bin/bash

if [ -f "$1" ];
then
  cd $(dirname $1);
else
  cd $1;
fi
