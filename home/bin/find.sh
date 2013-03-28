#!/bin/bash

if [ $# -eq 1 ] && [ $1 != "." ];
then
  find . -name $1;
else
  find $@;
fi
