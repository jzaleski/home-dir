sbtenv_bin_dir=$HOME/.sbtenv/bin;
if [ -d $sbtenv_bin_dir ] && [[ ! "$PATH" =~ "$sbtenv_bin_dir" ]]; then
  export PATH=$sbtenv_bin_dir:$PATH;
fi

sbtenv_shims_dir=$HOME/.sbtenv/shims;
if [ -d $sbtenv_shims_dir ] && [[ ! "$PATH" =~ "$sbtenv_shims_dir" ]]; then
  export PATH=$sbtenv_shims_dir:$PATH;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && which sbtenv 2>&1 > /dev/null; then
  sbtenv rehash;
fi
