# Ensure that the `sudo` command is in the `$PATH`
sudo_cmd=`\which sudo 2> /dev/null`;
if [ -z "$sudo_cmd" ]; then
  return;
fi

# Ensure that the `mount` command is in the `$PATH`
mount_cmd=`\which mount 2> /dev/null`;
if [ -z "$mount_cmd" ]; then
  return;
fi

# Short-circuit if the `$mounts_file` does not exist
mounts_file=$HOME/.mounts;
if [ ! -f $mounts_file ]; then
  return;
fi

# Process the `$mounts_file`
for line in `\cat $mounts_file`; do
  # This is necessary in order to support the interpolation of env-vars
  mount=`eval echo $line`;
  # Ensure the `$mount` variable is not empty
  if [ -n "$mount" ]; then
    # Only add the mount if it hasn't already been added
    if [ `$mount_cmd | \grep -c $mount` -eq 0 ]; then
      (cd /tmp && $sudo_cmd -E $mount_cmd $mount);
    fi
  fi
done
