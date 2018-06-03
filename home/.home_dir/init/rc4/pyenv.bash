pyenv_bin_dir=$HOME/.pyenv/bin;
if [ -d $pyenv_bin_dir ] && [[ ! "$PATH" =~ "$pyenv_bin_dir" ]]; then
  export PATH=$pyenv_bin_dir:$PATH;
fi

pyenv_shims_dir=$HOME/.pyenv/shims;
if [ -d $pyenv_shims_dir ] && [[ ! "$PATH" =~ "$pyenv_shims_dir" ]]; then
  export PATH=$pyenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which pyenv 2>&1 > /dev/null; then
  pyenv rehash;
fi
