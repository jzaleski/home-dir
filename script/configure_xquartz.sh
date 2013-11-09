#!/bin/bash

if [ `uname` == 'Darwin' ];
then
  defaults write org.macosforge.xquartz.X11 app_to_run "/opt/X11/bin/uxterm";
fi
