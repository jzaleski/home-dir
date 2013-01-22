#!/bin/bash

grep_cmd=`which grep`;

$grep_cmd --color -P $@;
