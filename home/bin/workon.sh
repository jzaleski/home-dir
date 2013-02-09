#!/bin/bash

if [ $# -eq 1 ];
then
	my_cnf_file=$HOME/.my.cnf.$1;
	if [ -f $my_cnf_file ];
	then
		ln -sf $my_cnf_file $HOME/.my.cnf;
	fi

	deactivate 2> /dev/null;
	activate_script=$HOME/.virtualenv/$1/bin/activate;
	if [ -f $activate_script ];
	then
		source $activate_script;
	fi

	source_directory=$HOME/src/$1;
	if [ -d $source_directory ];
	then
		cd $source_directory;
	fi
fi
