if [ -z "$GOENV_GOPATH_PREFIX" ]; then
  export GOENV_GOPATH_PREFIX=$HOME/.go;
fi

goenv_bin_dir=$HOME/.goenv/bin;
if [ -d $goenv_bin_dir ] && [[ ! "$PATH" =~ "$goenv_bin_dir" ]]; then
  export PATH=$goenv_bin_dir:$PATH;
fi

goenv_shims_dir=$HOME/.goenv/shims;
if [ -d $goenv_shims_dir ] && [[ ! "$PATH" =~ "$goenv_shims_dir" ]]; then
  export PATH=$goenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which goenv 2>&1 > /dev/null; then
  goenv rehash;
fi
