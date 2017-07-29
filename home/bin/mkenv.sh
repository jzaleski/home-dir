#!/usr/bin/env bash

set -e;

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [[ ! $type =~ ^(go|java|mono|python|ruby)$ ]]; then
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

workonrc_file=.workonrc;
if [ "$type" = "go" ]; then
  echo -e "export GOPATH=$environment_directory;\nGO_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ "$type" = "java" ]; then
  echo -e "export CLASSPATH=$PWD;\nexport JAVA_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ "$type" = "mono" ]; then
  echo -e "export MONO_GAC_PREFIX=$environment_directory;\nexport MONO_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ "$type" = "python" ]; then
  echo -e "export PIP_CONFIG_FILE=$environment_directory/pip.conf;\nexport PYTHON_ENVIRONMENT=$environment_directory;\nexport PYTHONPATH=\$(find $environment_directory -name site-packages 2> /dev/null);\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ "$type" = "ruby" ]; then
  echo -e "export GEM_HOME=$environment_directory;\nexport GEM_PATH=$environment_directory;\nexport RUBY_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
fi

if [ "$type" = "python" ]; then
  pip_conf_file="$environment_directory/pip.conf";
  if [ ! -e $pip_conf_file ]; then
    echo -e "[install]\nprefix = $PWD/$environment_directory" > $pip_conf_file;
  fi
fi
