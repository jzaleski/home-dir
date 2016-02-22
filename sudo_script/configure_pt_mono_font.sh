#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ] && [ ! -d /tmp/PT_Mono ] && [ `uname` != "Darwin" ]; then
  wget_cmd=`\which wget 2> /dev/null`;
  if [ -z "$wget_cmd" ]; then
    echo "Could not locate the \"wget\" binary";
    exit 1;
  fi

  unzip_cmd=`\which unzip 2> /dev/null`;
  if [ -z "$unzip_cmd" ]; then
    echo "Could not locate the \"unzip\" binary";
    exit 1;
  fi

  fc_cache_cmd=`which fc-cache 2> /dev/null`;
  if [ -z "$fc_cache_cmd" ]; then
    echo "Could not locate the \"fc-cache\" binary";
    exit 1;
  fi

  truetype_fonts_directory=/usr/share/fonts/truetype;
  if [ ! -d $truetype_fonts_directory ]; then
    mkdir -p $truetype_fonts_directory;
  fi

  mkdir -p /tmp/PT_Mono &&
  cd /tmp/PT_Mono &&
  $wget_cmd --content-disposition "http://www.google.com/fonts/download?kit=7qsh9BNBJbZ6khIbS3ZpfKCWcynf_cDxXwCLxiixG1c" &&
  $unzip_cmd PT_Mono.zip &&
  rm PT_Mono.zip &&
  cd .. &&
  cp -R PT_Mono $truetype_fonts_directory &&
  $fc_cache_cmd -fv;
fi
