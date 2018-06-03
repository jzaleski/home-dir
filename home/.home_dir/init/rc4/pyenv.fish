set pyenv_bin_dir $HOME/.pyenv/bin;
if begin; test -d $pyenv_bin_dir; and not contains $pyenv_bin_dir $PATH; end
  set PATH $pyenv_bin_dir $PATH;
end

set pyenv_shims_dir $HOME/.pyenv/shims;
if begin; test -d $pyenv_shims_dir; and not contains $pyenv_shims_dir $PATH; end
  set PATH $pyenv_shims_dir $PATH;
end

set norehash_file $HOME/.norehash;
if begin; not test -e $norehash_file; and \which pyenv 2>&1 > /dev/null; end
  pyenv rehash;
end
