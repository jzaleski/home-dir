rbenv_cmd=`\which rbenv 2> /dev/null`;
if [ -z "$RBENV_SHELL" ] && [ -n "$rbenv_cmd" ]; then
  eval "$($rbenv_cmd init -)";
fi
