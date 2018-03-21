ssh_add_cmd=`\which ssh-add 2> /dev/null`;
if [ -z "$ssh_add_cmd" ]; then
  return;
fi

ssh_agent_cmd=`\which ssh-agent 2> /dev/null`;
if [ -z "$ssh_agent_cmd" ]; then
  return;
fi

private_keys_file=$HOME/.private_keys;
if [ -f $private_keys_file ]; then
  while read line; do
    private_key_file=`eval echo $line`;
    if [ -f $private_key_file ]; then
      if [ `$ssh_add_cmd -l | \grep -c "$private_key_file"` -eq 0 ]; then
        $ssh_add_cmd -t 0 $private_key_file;
      fi
    fi
  done < $private_keys_file;
fi
