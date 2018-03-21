if type -q rbenv
  set rbenv_shims_dir $HOME/.rbenv/shims;
  if not contains $rbenv_shims_dir $PATH
    set PATH $rbenv_shims_dir $PATH;
    rbenv rehash;
  end
end
