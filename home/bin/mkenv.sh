#!/usr/bin/env bash

# TODO: Allow `$LIBRARY_DIRECTORY` to be specified in the environment

set -e;

if [ -n "$TYPE" ]; then
  type=$TYPE;
elif [ -n "$1" ]; then
  type=$1;
fi

if [ -n "$VERSION" ]; then
  version=$VERSION;
elif [ -n "$2" ]; then
  version=$2;
else
  version=latest;
fi

if \
  [[ ! $type =~ ^(python|ruby)$ ]] || \
  [[ ! $version =~ ^(latest|[0-9]+\.[0-9]+\.?[0-9]*)$ ]]; then
  echo "$(basename $0 .sh) <type> <version>";
  exit 1;
fi

if [ "$version" = "latest" ]; then
  library_directory="$HOME/.local/$type/latest"
else
  library_directory="$HOME/.local/$type/${type}-${version}";
fi

if [ ! -d $library_directory ] && [ ! -h $library_directory ]; then
  echo "Could not find a library for the specified type & version";
  exit 1;
fi

if [ "$version" = "latest" ]; then
  install_directory=".${type}_environment-$(readlink $library_directory)";
else
  install_directory=".${type}_environment-${type}-${version}";
fi

if [ -d $install_directory ] && [ "$FORCE" != "true" ]; then
  echo "Install directory exists, set \"FORCE=true\" and re-run to overwrite";
  exit 1;
fi

install_bin_directory="$install_directory/bin";
if [ ! -e $install_bin_directory ]; then
  mkdir -p $install_bin_directory;
fi

(
  builtin cd $install_bin_directory &&
  for binary in `\ls $library_directory/bin;`; do
    ln -sf $library_directory/bin/$binary $binary;
  done
);

default_environment_directory=".${type}_environment";
if [ ! -e $default_environment_directory ]; then
  ln -s $install_directory $default_environment_directory;
fi

workonrc_file=.workonrc;
if [ ! -e $workonrc_file ]; then
  touch .workonrc;
fi

if [ "$type" = "python" ]; then
  pip_conf_file="$install_directory/pip.conf";
  if [ ! -e $pip_conf_file ]; then
    echo -e "[install]\nprefix = $install_directory" > $pip_conf_file;
  fi
fi
