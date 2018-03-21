if type -q nodenv
  set nodenv_shims_dir $HOME/.nodenv/shims;
  if not contains $nodenv_shims_dir $PATH
    set PATH $nodenv_shims_dir $PATH;
    nodenv rehash;
  end
end
