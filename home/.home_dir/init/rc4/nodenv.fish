set nodenv_bin_dir $HOME/.nodenv/bin;
if begin; test -d $nodenv_bin_dir; and not contains $nodenv_bin_dir $PATH; end
  set PATH $nodenv_bin_dir $PATH;
end

set nodenv_shims_dir $HOME/.nodenv/shims;
if begin; test -d $nodenv_shims_dir; and not contains $nodenv_shims_dir $PATH; end
  set PATH $nodenv_shims_dir $PATH;
  nodenv rehash;
end
