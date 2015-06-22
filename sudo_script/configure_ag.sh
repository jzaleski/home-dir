#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ -z `\which ag 2> /dev/null` ]; then
  apt_get_cmd=`\which apt-get 2> /dev/null`;
  if [ -n "$apt_get_cmd" ]; then
    $apt_get_cmd install -y liblzma5 liblzma-dev libpcre3 libpcre3-dev &&
    cd /tmp &&
    git clone git://github.com/ggreer/the_silver_searcher.git &&
    cd the_silver_searcher &&
    sh build.sh &&
    make install &&
    cd .. &&
    rm -rf the_silver_searcher;
  fi
fi
