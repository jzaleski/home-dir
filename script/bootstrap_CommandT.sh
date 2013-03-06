#!/bin/sh

# Compile the extension (if it doesn't already exist)
cd $HOME/.vim/bundle/CommandT/ruby/command-t;
if [ ! -f "ext.bundle" ];
then
	ruby extconf.rb;
	make;
fi
