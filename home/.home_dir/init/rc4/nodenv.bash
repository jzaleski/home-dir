nodenv_bin_dir=$HOME/.nodenv/bin;
if [ -d $nodenv_bin_dir ] && [[ ! "$PATH" =~ "$nodenv_bin_dir" ]]; then
  export PATH=$nodenv_bin_dir:$PATH;
fi

nodenv_shims_dir=$HOME/.nodenv/shims;
if [ -d $nodenv_shims_dir ] && [[ ! "$PATH" =~ "$nodenv_shims_dir" ]]; then
  export PATH=$nodenv_shims_dir:$PATH;
  nodenv rehash;
fi
