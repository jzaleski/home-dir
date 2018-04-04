sbtenv_bin_dir=$HOME/.sbtenv/bin;
if [ -d $sbtenv_bin_dir ] && [[ ! "$PATH" =~ "$sbtenv_bin_dir" ]]; then
  export PATH=$sbtenv_bin_dir:$PATH;
fi

sbtenv_shims_dir=$HOME/.sbtenv/shims;
if [ -d $sbtenv_shims_dir ] && [[ ! "$PATH" =~ "$sbtenv_shims_dir" ]]; then
  export PATH=$sbtenv_shims_dir:$PATH;
  sbtenv rehash;
fi
