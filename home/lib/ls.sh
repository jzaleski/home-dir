#!/usr/bin/env bash

export LSCOLORS=${LSCOLORS:-"ExFxBxDxCxegedabagacad"};

\ls --color "$@";
