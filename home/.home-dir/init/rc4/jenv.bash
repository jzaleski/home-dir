jenv_bin_dir=$HOME/.jenv/bin;
if [ -d $jenv_bin_dir ] && [[ ! "$PATH" =~ "$jenv_bin_dir" ]]; then
  export PATH=$jenv_bin_dir:$PATH;
fi

jenv_shims_dir=$HOME/.jenv/shims;
if [ -d $jenv_shims_dir ] && [[ ! "$PATH" =~ "$jenv_shims_dir" ]]; then
  export PATH=$jenv_shims_dir:$PATH;
fi

if which jenv > /dev/null 2>&1; then
  noinit_file=$HOME/.noinit;
  if [ ! -e "$noinit_file" ] && [ ! -e "$HOME/.jenv/plugins/export" ]; then
    jenv sh-enable-plugin export;
  fi

  if [ ! -e "$noinit_file" ] && [ ! -e "$HOME/.jenv/plugins/maven" ]; then
    jenv sh-enable-plugin maven;
  fi

  norehash_file=$HOME/.norehash;
  if [ ! -e $norehash_file ]; then
    jenv sh-rehash;
  fi

  if [ -z "$JENV_LOADED" ]; then
    export JENV_LOADED=1;
  fi
fi
