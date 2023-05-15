nodenv_bin_dir=$HOME/.nodenv/bin;
if [ -d $nodenv_bin_dir ] && [[ ! "$PATH" =~ "$nodenv_bin_dir" ]]; then
  export PATH=$nodenv_bin_dir:$PATH;
fi

nodenv_shims_dir=$HOME/.nodenv/shims;
if [ -d $nodenv_shims_dir ] && [[ ! "$PATH" =~ "$nodenv_shims_dir" ]]; then
  export PATH=$nodenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && which nodenv 2>&1 > /dev/null; then
  nodenv rehash;
fi
