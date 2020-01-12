jenv_bin_dir=$HOME/.jenv/bin;
if [ -d $jenv_bin_dir ] && [[ ! "$PATH" =~ "$jenv_bin_dir" ]]; then
  export PATH=$jenv_bin_dir:$PATH;
fi

jenv_shims_dir=$HOME/.jenv/shims;
if [ -d $jenv_shims_dir ] && [[ ! "$PATH" =~ "$jenv_shims_dir" ]]; then
  export PATH=$jenv_shims_dir:$PATH;
fi

noinit_file=$HOME/.noinit;
if [ ! -e "$noinit_file" ] && [ ! -e "$HOME/.jenv/plugins/export" ]; then
  jenv enable-plugin export;
fi

if [ ! -e "$noinit_file" ] && [ ! -e "$HOME/.jenv/plugins/maven" ]; then
  jenv enable-plugin maven;
fi

norehash_file=$HOME/.norehash;
if [ ! -e $norehash_file ] && \which jenv 2>&1 > /dev/null; then
  jenv rehash;
fi
