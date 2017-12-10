#!/usr/bin/env bash

set -e;

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [[ $type =~ ^python ]]; then
  $HOME/bin/mkvirtualenv.sh $type false;
  exit $?;
fi

if [[ ! $type =~ ^(go|java|ruby)$ ]]; then
  echo "$(basename $0 .sh) <type>";
  exit 1;
fi

environment_directory="$PWD/.${type}_environment";
if [ ! -d $environment_directory ]; then
  mkdir $environment_directory;
fi

environment_bin_directory=$environment_directory/bin;
if [ ! -d $environment_bin_directory ]; then
  mkdir $environment_bin_directory;
fi

environment_lib_directory=$environment_directory/lib;
if [ ! -d $environment_lib_directory ]; then
  mkdir $environment_lib_directory;
fi

workonrc_file=.workonrc;
if [ $type = "go" ]; then
  echo -e "export GOPATH=$environment_directory;\nGO_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ $type = "java" ]; then
  echo -e "export CLASSPATH=$environment_lib_directory/*.jar;\nexport JAVA_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ $type = "ruby" ]; then
  echo -e "export GEM_HOME=$environment_directory;\nexport GEM_PATH=$environment_directory;\nexport RUBY_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
fi
