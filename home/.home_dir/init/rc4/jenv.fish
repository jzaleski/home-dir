set jenv_bin_dir $HOME/.jenv/bin;
if begin; test -d $jenv_bin_dir; and not contains $jenv_bin_dir $PATH; end
  set PATH $jenv_bin_dir $PATH;
end

set jenv_shims_dir $HOME/.jenv/shims;
if begin; test -d $jenv_shims_dir; and not contains $jenv_shims_dir $PATH; end
  set PATH $jenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and \which jenv 2>&1 > /dev/null; end
  jenv rehash;
end
