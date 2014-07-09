#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ -z `which tmux` ]; then
  apt_cmd=`which apt-get`;
  if [ -n "$apt_cmd" ]; then
    $apt_cmd install -y libncurses5-dev libevent-dev &&
    cd /tmp &&
    wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz &&
    tar -xvzf tmux-1.9a.tar.gz &&
    cd tmux-1.9a &&
    ./configure &&
    make &&
    make install &&
    cd .. &&
    rm -rf tmux-1.9a;
  fi
fi
