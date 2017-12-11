#!/usr/bin/env bash

set -e;

type=$1;
if [ -z "$type" ]; then
  echo "$(basename $0 .sh) <type>";
  exit 1;
fi

set_as_default=$2;

if [[ ! $type =~ ^[j]?ruby$ ]]; then
  echo "$(basename $0 .sh) does not currently support: $type";
  exit 1;
fi

if [ $type = "jruby" ]; then
  version=$type;
else
  version=mri;
fi

new_environment_directory=.ruby_environment-$version;
if [ ! -d $new_environment_directory ]; then
  mkdir $new_environment_directory;
fi

new_environment_bin_directory=$new_environment_directory/bin;
if [ ! -d $new_environment_bin_directory ]; then
  mkdir $new_environment_bin_directory;
fi

new_environment_lib_directory=$new_environment_directory/lib;
if [ ! -d $new_environment_lib_directory ]; then
  mkdir $new_environment_lib_directory;
fi

if [ $type = "jruby" ]; then
  irb_cmd=$new_environment_bin_directory/irb;
  if [ ! -e $irb_cmd ]; then
    ln -s `\which jirb` $irb_cmd;
  fi

  gem_cmd=$new_environment_bin_directory/gem;
  if [ ! -e $gem_cmd ]; then
    ln -s `\which jgem` $gem_cmd;
  fi

  ruby_cmd=$new_environment_bin_directory/ruby;
  if [ ! -e $ruby_cmd ]; then
    ln -s `\which jruby` $ruby_cmd;
  fi
fi

default_environment_directory=.ruby_environment;
if [ "$set_as_default" = true ]; then
  rm -f $default_environment_directory;
fi

if [ ! -e $default_environment_directory ]; then
  ln -s $new_environment_directory $default_environment_directory;
fi

workonrc_file=.workonrc;
if [ "$set_as_default" = true ]; then
  rm -f $workonrc_file;
fi

if [ ! -e $workonrc_file ]; then
  echo -e "export GEM_HOME=$new_environment_directory;\nexport GEM_PATH=$new_environment_directory;\nexport RUBY_ENVIRONMENT=$new_environment_directory;\nexport PATH=$new_environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
fi
