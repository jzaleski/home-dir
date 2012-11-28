#!/bin/bash

if [ $# -gt 2 ] && [ $1 == 'generate' ];
then
	file=~/.my.cnf.$2;
	echo -e "!include ~/.base.my.cnf\n\n[client]" > $file;
	for arg in "${@:3}";
	do
		echo "${arg/--/}" >> $file;
	done
	exit 0;
fi

if [ $# -eq 1 ] && [ $1 != 'generate' ];
then
	file=~/.my.cnf.$1;
	if [ -f $file ];
	then
		ln -sf $file ~/.my.cnf;
		exit 0;
	else
		echo "could not find a .my.cnf file at: $file";
		exit 255;
	fi
fi

echo "Usage: `basename $0` [my_cnf_file] | [generate --key=value ... ]"
exit 2;
