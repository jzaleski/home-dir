#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ ! -e /usr/local/bin/autocutsel ]; then
  yum_cmd=`\which yum 2> /dev/null`;
  if [ -n "$yum_cmd" ]; then
    $yum_cmd install -y libXaw libXaw-devel;

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
