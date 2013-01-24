#!/bin/bash

git_root=`git rev-parse --show-toplevel 2> /dev/null`;

if [ -n "$git_root" ];
then
	cd $git_root;
else
	echo 'Not in a "git" directory';
fi
