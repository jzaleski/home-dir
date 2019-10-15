jenv_bin_dir=$HOME/.jenv/bin;
if [ -d $jenv_bin_dir ] && [[ ! "$PATH" =~ "$jenv_bin_dir" ]]; then
  export PATH=$jenv_bin_dir:$PATH;
fi

jenv_shims_dir=$HOME/.jenv/shims;
if [ -d $jenv_shims_dir ] && [[ ! "$PATH" =~ "$jenv_shims_dir" ]]; then
  export PATH=$jenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which jenv 2>&1 > /dev/null; then
  jenv rehash;
fi
