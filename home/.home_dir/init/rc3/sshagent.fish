set private_keys_file $HOME/.private_keys;
if test -f $private_keys_file
  for line in (cat $private_keys_file)
    set private_key_file (eval echo $line);
    if test -f $private_key_file
      if not eval ssh-add -l | grep -c "$private_key_file" > /dev/null
        ssh-add -t 0 $private_key_file;
      end
    end
  end
end
