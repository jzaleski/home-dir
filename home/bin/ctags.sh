#!/bin/sh

ctags_cmd=`which ctags`;
if [ $? -eq 0 ];
then
	rm -f .git/tags;
	$ctags_cmd -f .git/tags . > /dev/null 2>&1 &
fi
