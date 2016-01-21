#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ ! -d /tmp/the_silver_searcher ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      pcre-devel \
      xz-devel;
  fi

  cd /tmp &&
  git clone git://github.com/ggreer/the_silver_searcher.git &&
  cd the_silver_searcher &&
  sh build.sh &&
  make install;
fi
