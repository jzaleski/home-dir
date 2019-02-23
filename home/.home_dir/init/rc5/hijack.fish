set hijack_dir $SOURCE_DIRECTORY/hijack;
set hijack_config_dir $HOME/.hijack/conf;
if begin test -d $hijack_dir; and test -d $hijack_config_dir; end
  for game_dir in (ls $hijack_config_dir 2> /dev/null)
    for conf_file in (ls $hijack_config_dir/$game_dir/*.conf 2> /dev/null)
      set character (basename $conf_file | sed 's/.conf//');
      set character_file_no_extension $hijack_config_dir/$game_dir/$character;
      set character_conf_file $character_file_no_extension.conf;
      set character_inputrc_file $character_file_no_extension.inputrc;
      alias hijack-$game_dir-$character="pushd $hijack_dir; and env INPUTRC=$character_inputrc_file bin/launch --config-file=$character_conf_file; and popd";
    end
  end
end
