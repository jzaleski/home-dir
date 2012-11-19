#!/bin/bash

if [ $# -eq 1 ];
then
	my_cnf_file="$HOME/.my.cnf.$1"
	if [ -f $my_cnf_file ];
	then
		ln -sf $my_cnf_file ~/.my.cnf;
	else
		echo "could not find a .my.cnf file at: $my_cnf_file";
	fi
fi
