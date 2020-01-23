#!/usr/bin/env bash

if [ -n "$BOOTSTRAP_DESKTOP_ENVIRONMENT" ]; then
  yum_cmd=$(which yum 2> /dev/null || echo -n);
  if [ -n "$yum_cmd" ]; then
    $yum_cmd groupinstall -y "Fonts" "X Window System";

    $yum_cmd install -y \
      firefox \
      gnome-terminal \
      msttcore-fonts-installer \
      xmonad;
  fi
fi
