#!/usr/bin/env bash

set -e;

type=$1;
if [ -z "$type" ]; then
  echo "$(basename $0 .sh) <type>";
  exit 1;
fi

set_as_default=$2;

virtualenv_cmd=`\which virtualenv 2> /dev/null`;
if [ -z "$virtualenv_cmd" ]; then
  echo "Could not locate the \"virtualenv\" binary";
  exit 1;
fi

if [[ ! $type =~ ^python(2\.7|3\.6)$ ]]; then
  echo "$(basename $0 .sh) does not currently support: $type";
  exit 1;
fi

version=`echo $type | sed s/python//`;
if [ -z "$version" ]; then
  echo "Could not determine version from type: $type";
  exit 1;
fi

new_environment_dir=.python_environment-$version;
if [ ! -e $new_environment_dir ]; then
  $virtualenv_cmd -p $type $new_environment_dir;
fi

default_environment_dir=.python_environment;
if [ "$set_as_default" = true ]; then
  rm -f $default_environment_dir;
fi

if [ ! -e $default_environment_dir ]; then
  ln -s $new_environment_dir $default_environment_dir;
fi

