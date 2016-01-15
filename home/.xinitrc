xmonad_cmd=`\which xmonad 2> /dev/null`;
if [ -n "$xmonad_cmd" ]; then
  $xmonad_cmd;
fi
