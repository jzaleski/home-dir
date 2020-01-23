vbox_client_all_cmd=$(which VBoxClient-all || echo -n);
if [ -n "$vbox_client_all_cmd" ]; then
  $vbox_client_all_cmd;
fi

xdefaults_file=$HOME/.Xdefaults;
if [ -f $xdefaults_file ]; then
  xrdb $xdefaults_file;
fi

xmonad_cmd=$(which xmonad 2> /dev/null || echo -n);
if [ -n "$xmonad_cmd" ]; then
  $xmonad_cmd;
fi
