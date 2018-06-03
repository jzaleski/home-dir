set rbenv_bin_dir $HOME/.rbenv/bin;
if begin; test -d $rbenv_bin_dir; and not contains $rbenv_bin_dir $PATH; end
  set PATH $rbenv_bin_dir $PATH;
end

set rbenv_shims_dir $HOME/.rbenv/shims;
if begin; test -d $rbenv_shims_dir; and not contains $rbenv_shims_dir $PATH; end
  set PATH $rbenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and \which rbenv 2>&1 > /dev/null; end
  rbenv rehash;
end
