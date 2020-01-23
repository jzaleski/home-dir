set jenv_bin_dir $HOME/.jenv/bin;
if begin; test -d $jenv_bin_dir; and not contains $jenv_bin_dir $PATH; end
  set PATH $jenv_bin_dir $PATH;
end

set jenv_shims_dir $HOME/.jenv/shims;
if begin; test -d $jenv_shims_dir; and not contains $jenv_shims_dir $PATH; end
  set PATH $jenv_shims_dir $PATH;
end

if which jenv > /dev/null 2>&1
  set noinit_file $HOME/.noinit;
  if begin; not test -e $noinit_file; and not test -e "$HOME/.jenv/plugins/export"; end
    jenv sh-enable-plugin export;
  end

  if begin; not test -e $noinit_file; and not test -e "$HOME/.jenv/plugins/maven"; end
    jenv sh-enable-plugin maven;
  end

  set norehash_file $HOME/.norehash;
  if not test -e $norehash_file
    jenv sh-rehash;
  end
end
