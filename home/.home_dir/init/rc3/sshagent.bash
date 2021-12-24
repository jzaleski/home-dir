# Ensure that the `ssh-agent` command is in the `$PATH`
if ! which ssh-agent > /dev/null 2>&1; then
  return;
fi

# Ensure that the `ssh-add` command is in the `$PATH`
if ! which ssh-add > /dev/null 2>&1; then
  return;
fi

# Short-circuit if the `$private_keys_file` does not exist
private_keys_file=$HOME/.private-keys;
if [ ! -f $private_keys_file ]; then
  return;
fi

# Start "ssh-agent" if there isn't one running
ssh_env_file=$HOME/.ssh/environment.$(basename $SHELL);
if [ ! -f "$ssh_env_file" ] || [ $(ps -ef | \grep -c "[s]sh-agent") -eq 0 ]; then
  ssh-agent | \head -2 > $ssh_env_file;
  chmod 0600 $ssh_env_file;
fi

# Source the "ssh-agent" environment file
if [ -f $ssh_env_file ]; then
  source $ssh_env_file;
fi

# Process the `$private_keys_file`
for line in $(cat $private_keys_file); do
  # This is necessary in order to support the interpolation of env-vars
  private_key_file_full_path=$(eval echo $line);
  # Ensure the `$private_key_file_full_path` exists
  if [ -f $private_key_file_full_path ]; then
    # Extract the file-name from the full-path
    private_key_file=$(echo $private_key_file_full_path | \sed -e 's/\/.*\///g');
    # Only add the key if it hasn't already been added
    if ! ssh-add -l | \grep -E "$private_key_file" > /dev/null; then
      ssh-add -t 0 $private_key_file_full_path;
    fi
  fi
done
