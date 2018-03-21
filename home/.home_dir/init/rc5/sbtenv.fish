if type -q sbtenv
  set sbtenv_shims_dir $HOME/.sbtenv/shims;
  if not contains $sbtenv_shims_dir $PATH
    set PATH $sbtenv_shims_dir $PATH;
    sbtenv rehash;
  end
end
