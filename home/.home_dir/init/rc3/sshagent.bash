# Ensure that the `ssh-agent` command is in the `$PATH`
ssh_agent_cmd=`\which ssh-agent 2> /dev/null`;
if [ -z "$ssh_agent_cmd" ]; then
  return;
fi

# Ensure that the `ssh-add` command is in the `$PATH`
ssh_add_cmd=`\which ssh-add 2> /dev/null`;
if [ -z "$ssh_add_cmd" ]; then
  return;
fi

# Short-circuit if the `$private_keys_file` does not exist
private_keys_file=$HOME/.private_keys;
if [ ! -f $private_keys_file ]; then
  return;
fi

# Start "ssh-agent" if there isn't one running
ssh_env_file=$HOME/.ssh/environment.$(basename $SHELL);
if [ ! -f "$ssh_env_file" ] || [ `ps -ef | \grep -c "[s]sh-agent"` -eq 0 ]; then
  $ssh_agent_cmd | \head -2 > $ssh_env_file;
  chmod 0600 $ssh_env_file;
fi

# Source the "ssh-agent" environment file
if [ -f $ssh_env_file ]; then
  source $ssh_env_file;
fi

# Process the `$private_keys_file`
for line in `\cat $private_keys_file`; do
  # This is necessary in order to support the interpolation of env-vars
  private_key_file=`eval echo $line`;
  # Ensure the `$private_key_file` exists
  if [ -f $private_key_file ]; then
    # Only add the key if it hasn't already been added
    if [ `$ssh_add_cmd -l | \grep -c "$private_key_file"` -eq 0 ]; then
      $ssh_add_cmd -t 0 $private_key_file;
    fi
  fi
done
