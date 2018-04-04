pyenv_bin_dir=$HOME/.pyenv/bin;
if [ -d $pyenv_bin_dir ] && [[ ! "$PATH" =~ "$pyenv_bin_dir" ]]; then
  export PATH=$pyenv_bin_dir:$PATH;
fi

pyenv_shims_dir=$HOME/.pyenv/shims;
if [ -d $pyenv_shims_dir ] && [[ ! "$PATH" =~ "$pyenv_shims_dir" ]]; then
  export PATH=$pyenv_shims_dir:$PATH;
  pyenv rehash;
fi
