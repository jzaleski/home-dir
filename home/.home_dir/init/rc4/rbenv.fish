set rbenv_bin_dir $HOME/.rbenv/bin;
if begin; test -d $rbenv_bin_dir; and not contains $rbenv_bin_dir $PATH; end
  set PATH $rbenv_bin_dir $PATH;
end

set rbenv_shims_dir $HOME/.rbenv/shims;
if begin; test -d $rbenv_shims_dir; and not contains $rbenv_shims_dir $PATH; end
  set PATH $rbenv_shims_dir $PATH;
  rbenv rehash;
end
