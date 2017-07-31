#!/usr/bin/env bash

set -e;

if [ -n "$TYPE" ]; then
  raw_type=$TYPE;
elif [ -n "$1" ]; then
  raw_type=$1;
fi

if [[ ! $raw_type =~ ^(go|java|mono|python[2-3]?|ruby)$ ]]; then
  echo "$(basename $0 .sh) <type>";
  exit 1;
fi

if [[ $raw_type =~ ^python[2-3]$ ]]; then
  type="python";
else
  type=$raw_type;
fi

environment_directory="$PWD/.${type}_environment";
if [ ! -d $environment_directory ]; then
  mkdir $environment_directory;
fi

environment_bin_directory=$environment_directory/bin;
if [ ! -d $environment_bin_directory ]; then
  mkdir $environment_bin_directory;
fi

if [[ $raw_type =~ ^python[2-3]$ ]]; then
  python_version=`echo $raw_type | sed s/\python//`;
  for python_binary in \
    idle \
    pip \
    pydoc \
    python \
    wheel;
  do
    versioned_python_binary=`\which $python_binary$python_version 2> /dev/null`;
    if [ -n "$versioned_python_binary" ]; then
      ln -sf $versioned_python_binary $environment_bin_directory/$python_binary;
    fi
  done
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
elif [ $type = "mono" ]; then
  echo -e "export MONO_GAC_PREFIX=$environment_directory;\nexport MONO_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ $type = "python" ]; then
  echo -e "export PIP_CONFIG_FILE=$environment_directory/pip.conf;\nexport PYTHONPATH=\$(find $environment_directory -name site-packages 2> /dev/null | grep $raw_type);\nexport PYTHON_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
elif [ $type = "ruby" ]; then
  echo -e "export GEM_HOME=$environment_directory;\nexport GEM_PATH=$environment_directory;\nexport RUBY_ENVIRONMENT=$environment_directory;\nexport PATH=$environment_bin_directory:\$(echo \$PATH);" > $workonrc_file;
fi

if [ $type = "python" ]; then
  pip_conf_file="$environment_directory/pip.conf";
  if [ ! -e $pip_conf_file ]; then
    echo -e "[install]\nprefix = $environment_directory" > $pip_conf_file;
  fi
fi
