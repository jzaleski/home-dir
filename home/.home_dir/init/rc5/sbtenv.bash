sbtenv_cmd=`\which sbtenv 2> /dev/null`;
if [ -z "$SBTENV_SHELL" ] && [ -n "$sbtenv_cmd" ]; then
  eval "$($sbtenv_cmd init -)";
fi
