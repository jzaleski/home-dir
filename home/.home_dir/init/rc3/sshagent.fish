# Ensure that the `ssh-agent` command is in the `$PATH`
set ssh_agent_cmd (\which ssh-agent 2> /dev/null);
if test -z "$ssh_agent_cmd"
  exit 0;
end

# Ensure that the `ssh-add` command is in the `$PATH`
set ssh_add_cmd (\which ssh-add 2> /dev/null);
if test -z "$ssh_add_cmd"
  exit 0;
end

# Start "ssh-agent" if there isn't one running
set ssh_env_file $HOME/.ssh/environment.(basename $SHELL);
if begin; not test -f $ssh_env_file; or not ps -ef | \grep -c "[s]sh-agent" > /dev/null; end
  eval $ssh_agent_cmd | \head -2 > $ssh_env_file;
  sed -i "s/SSH_AGENT_PID=/set SSH_AGENT_PID /g" $ssh_env_file;
  sed -i "s/SSH_AUTH_SOCK=/set SSH_AUTH_SOCK /g" $ssh_env_file;
  chmod 0600 $ssh_env_file;
end


# Source the "ssh-agent" environment file
if test -f $ssh_env_file
  source $ssh_env_file;
end

# Process the `$private_key_file` if it exists
set private_keys_file $HOME/.private_keys;
if test -f $private_keys_file
  for line in (cat $private_keys_file)
    set private_key_file (eval echo $line);
    if test -f $private_key_file
      if not eval $ssh_add_cmd -l | \grep -c "$private_key_file" > /dev/null
        eval $ssh_add_cmd -t 0 $private_key_file;
      end
    end
  end
end
