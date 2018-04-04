set pyenv_bin_dir $HOME/.pyenv/bin;
if begin; test -d $pyenv_bin_dir; and not contains $pyenv_bin_dir $PATH; end
  set PATH $pyenv_bin_dir $PATH;
end

set pyenv_shims_dir $HOME/.pyenv/shims;
if begin; test -d $pyenv_shims_dir; and not contains $pyenv_shims_dir $PATH; end
  set PATH $pyenv_shims_dir $PATH;
  pyenv rehash;
end
