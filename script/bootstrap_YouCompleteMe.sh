#!/bin/sh

# Install required packages
if [ `uname` == 'Darwin' ];
then
	brew install boost cmake 1> /dev/null;
else
	sudo apt-get install -y build-essential cmake 1> /dev/null;
fi

# Compile the extension (if it doesn't already exist)
cd $HOME/.vim/bundle/YouCompleteMe;
if [ ! -f 'python/ycm_core.so' ];
then
	./install.sh;
fi
