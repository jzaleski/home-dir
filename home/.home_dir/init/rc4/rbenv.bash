rbenv_bin_dir=$HOME/.rbenv/bin;
if [ -d $rbenv_bin_dir ] && [[ ! "$PATH" =~ "$rbenv_bin_dir" ]]; then
  export PATH=$rbenv_bin_dir:$PATH;
fi

rbenv_shims_dir=$HOME/.rbenv/shims;
if [ -d $rbenv_shims_dir ] && [[ ! "$PATH" =~ "$rbenv_shims_dir" ]]; then
  export PATH=$rbenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which rbenv 2>&1 > /dev/null; then
  rbenv rehash;
fi
