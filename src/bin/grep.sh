#!/bin/bash

grep_cmd=`which egrep`;

$grep_cmd --color $@;
