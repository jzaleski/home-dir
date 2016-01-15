#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ ! -d /tmp/the_silver_searcher ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y \
      liblzma5 \
      liblzma-dev \
      libpcre3 \
      libpcre3-dev;
  fi

  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      pcre-devel \
      xz-devel;
  fi

  if [ -z "$apt_get_cmd" ] && [ -z "$yum_cmd" ]; then
    echo "Could not configure \"ag\"";
    exit 1;
  fi

  cd /tmp &&
  git clone git://github.com/ggreer/the_silver_searcher.git &&
  cd the_silver_searcher &&
  sh build.sh &&
  make install;
fi
