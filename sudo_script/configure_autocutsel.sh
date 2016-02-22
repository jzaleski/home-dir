#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ ! -d /tmp/autocutsel-0.10.0 ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y \
      automake \
      libXaw \
      libXaw-devel \
      wget;

    cd /tmp &&
    wget https://github.com/sigmike/autocutsel/releases/download/0.10.0/autocutsel-0.10.0.tar.gz &&
    tar -xvzf autocutsel-0.10.0.tar.gz &&
    cd autocutsel-0.10.0 &&
    autoreconf -vfi &&
    ./configure &&
    make &&
    make install;
  fi
fi
