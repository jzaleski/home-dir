# Clean-up the existing SSH environment file if it's no longer valid
ssh_env_file=$HOME/.ssh/environment.$(basename $SHELL);
if [ -f $ssh_env_file ]; then
  existing_ssh_auth_sock=$(source $ssh_env_file 2> /dev/null && echo $SSH_AUTH_SOCK || echo -n);
  if [ -z "$existing_ssh_auth_sock" ] || [ ! -e $existing_ssh_auth_sock ]; then
    rm -f $ssh_env_file;
  fi
fi
