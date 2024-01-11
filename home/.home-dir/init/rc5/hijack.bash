dot_hijack_dir=$HOME/.hijack;
hijack_conf_dir=$dot_hijack_dir/conf;
hijack_src_dir=$dot_hijack_dir/src;
ls_cmd=/bin/ls;
if \
  [ -e $hijack_conf_dir ] && \
  [ -h $hijack_src_dir ] && \
  [ -e $hijack_src_dir ];
then
  for game_dir in $($ls_cmd $hijack_conf_dir 2> /dev/null); do
    for conf_file in $($ls_cmd $hijack_conf_dir/$game_dir/*.conf 2> /dev/null); do
      character=$(basename "${conf_file%.*}");
      character_file_no_extension=$hijack_conf_dir/$game_dir/$character;
      character_conf_file=$character_file_no_extension.conf;
      character_inputrc_file=$character_file_no_extension.inputrc;
      alias hijack-$game_dir-$character="(cd $(readlink $hijack_src_dir) && INPUTRC=$character_inputrc_file bin/launch --config-file=$character_conf_file)";
    done
  done
fi
