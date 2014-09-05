#!/usr/bin/env bash

if [ -n "$EXTENDED_BOOTSTRAP" ]; then
  fonts_base_directory="/usr/share/fonts/truetype"
  if [ -n `which unzip` ] && [ -d "$fonts_base_directory" ] && [ ! -d "$fonts_base_directory/PT_Mono" ]; then
    # create a staging directory
    temp_dir='/tmp/PT_Mono';
    mkdir -p $temp_dir;
    cd $temp_dir;

    # download the font
    base_url="http://www.google.com/fonts/download";
    kit_identifier="7qsh9BNBJbZ6khIbS3ZpfKCWcynf_cDxXwCLxiixG1c";
    wget --content-disposition "$base_url?kit=$kit_identifier";

    # install the font
    unzip PT_Mono.zip;
    rm PT_Mono.zip;
    cd ..;
    mv PT_Mono /usr/share/fonts/truetype;

    # update the font-cache
    fc-cache -fv;
  fi
fi
