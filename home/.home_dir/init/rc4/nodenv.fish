set nodenv_bin_dir $HOME/.nodenv/bin;
if begin; test -d $nodenv_bin_dir; and not contains $nodenv_bin_dir $PATH; end
  set PATH $nodenv_bin_dir $PATH;
end

set nodenv_shims_dir $HOME/.nodenv/shims;
if begin; test -d $nodenv_shims_dir; and not contains $nodenv_shims_dir $PATH; end
  set PATH $nodenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and \which nodenv 2>&1 > /dev/null; end
  nodenv rehash;
end
