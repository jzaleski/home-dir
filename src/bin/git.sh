#!/bin/bash

git_cmd=`which git`;

if [ $# -eq 0 ];
then
	$git_cmd;
else
	helper_script=$HOME/bin/git-$1.sh;
	if [ -f $helper_script ];
	then
		shift;
		source $helper_script "$@";
	else
		$git_cmd "$@";
	fi
fi
