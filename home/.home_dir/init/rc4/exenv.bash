exenv_bin_dir=$HOME/.exenv/bin;
if [ -d $exenv_bin_dir ] && [[ ! "$PATH" =~ "$exenv_bin_dir" ]]; then
  export PATH=$exenv_bin_dir:$PATH;
fi

exenv_shims_dir=$HOME/.exenv/shims;
if [ -d $exenv_shims_dir ] && [[ ! "$PATH" =~ "$exenv_shims_dir" ]]; then
  export PATH=$exenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which exenv 2>&1 > /dev/null; then
  exenv rehash;
fi
