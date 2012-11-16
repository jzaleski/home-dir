#!/bin/bash

if [ $# -eq 1 ];
then
	activate_script="$HOME/.virtualenv/$1/bin/activate"
	if [ -f $activate_script ];
	then
		source $activate_script;
	else
		echo "could not find an activate script at: $activate_script";
	fi
fi
