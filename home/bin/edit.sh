#!/usr/bin/env bash

# Validate the text-editor is environment variable is specified
if [ -z "$TEXT_EDITOR" ]; then
  echo "No default text-editor specified (use: \"TEXT_EDITOR\" environment variable)";
  exit 1;
fi

# Verify that the "open" command exists
open_cmd=`which open`;
if [ -z "$open_cmd" ]; then
  echo "The \"open\" binary was not found in your \"PATH\"";
  exit 1;
fi

# Always pass along all the arguments, this will allow for opening
# single/multiple files as well as an empty editor instance
$open_cmd -a $TEXT_EDITOR "$@";
