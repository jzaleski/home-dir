mounts_file=$HOME/.mounts;
if [ -f $mounts_file ]; then
  sudo_cmd=`\which sudo 2> /dev/null`;
  mount_cmd=`\which mount 2> /dev/null`;
  if [ -n "$sudo_cmd" ] && [ -n "$mount_cmd" ]; then
    while read line; do
      # This is necessary in order to support interpolation of env-vars
      mount=`eval echo $line`;
      if [ -n "$mount" ]; then
        if [ `$mount_cmd | \grep -c $mount` -eq 0 ]; then
          (cd /tmp && $sudo_cmd -E $mount_cmd $mount);
        fi
      fi
    done < $mounts_file;
  fi
fi
