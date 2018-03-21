if type -q pyenv
  set pyenv_shims_dir $HOME/.pyenv/shims;
  if not contains $pyenv_shims_dir $PATH
    set PATH $pyenv_shims_dir $PATH;
    pyenv rehash;
  end
end
