vbox_client_all_cmd=`\which VBoxClient-all`;
if [ -n "$vbox_client_all_cmd" ]; then
  $vbox_client_all_cmd;
fi

xmonad_cmd=`\which xmonad 2> /dev/null`;
if [ -n "$xmonad_cmd" ]; then
  $xmonad_cmd;
fi
