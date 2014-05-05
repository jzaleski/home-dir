#!/bin/bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ -z `which ag` ];
then
  apt_cmd=`which apt-get`;
  if [ -n "$apt_cmd" ];
    then
    $apt_cmd install -y liblzma5 liblzma-dev libpcre3 libpcre3-dev &&
    cd /tmp &&
    git clone git://github.com/ggreer/the_silver_searcher.git &&
    cd the_silver_searcher &&
    sh build.sh &&
    make install &&
    cd .. &&
    rm -rf the_silver_searcher;
  fi
fi
