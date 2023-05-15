hijack_dir=$SOURCE_DIRECTORY/hijack;
hijack_config_dir=$HOME/.hijack/conf;
ls_cmd=/bin/ls;
if [ -d $hijack_dir ] && [ -d $hijack_config_dir ]; then
  for game_dir in $($ls_cmd $hijack_config_dir 2> /dev/null); do
    for conf_file in $($ls_cmd $hijack_config_dir/$game_dir/*.conf 2> /dev/null); do
      character=$(basename "${conf_file%.*}");
      character_file_no_extension=$hijack_config_dir/$game_dir/$character;
      character_conf_file=$character_file_no_extension.conf;
      character_inputrc_file=$character_file_no_extension.inputrc;
      alias hijack-$game_dir-$character="(cd $hijack_dir && INPUTRC=$character_inputrc_file bin/launch --config-file=$character_conf_file)";
    done
  done
fi
